import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobil_uygulama/main.dart';
import 'package:mobil_uygulama/screen/giris.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class kayit extends StatefulWidget {
  @override
  State<kayit> createState() => _kayitState();
}

String? isim;
String? sifre1;
String? sifre2;
String? isimsoyisim;
String? biografi;

class _kayitState extends State<kayit> {
  TextEditingController isim = TextEditingController();
  TextEditingController sifre1 = TextEditingController();
  TextEditingController sifre2 = TextEditingController();
  TextEditingController isimsoyisim = TextEditingController();
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseAuth auth1 = FirebaseAuth.instance;

  Future<bool?> kullanicikayitet() async {
    if (sifre1.text != sifre2.text) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("uyarı !"),
            content: const Text("şifreler uyuşmuyor"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("tamam"),
              ),
            ],
          );
        },
      );
      return false;
    }

    try {
      await Firebase.initializeApp();
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: isim.text, password: sifre1.text)
          .then((value) {
        FirebaseFirestore.instance
            .collection("Kullanicilar")
            .doc(isim.text)
            .set({
          "biografi": "",
          "İsimSoyisim": isimsoyisim.text,
          "KullaniciEposta": isim.text,
          "KullaniciSifre": sifre1.text
        }).then((value) {
          _buildHataMesaji("Kaydınız oluşturuldu...");
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AAAA()));
        });
      });
    } on Exception catch (_) {
      _buildHataMesaji("Lütfen Tekrar Deneyiniz");
    }
  }

  void _buildHataMesaji(String text) {
    Fluttertoast.showToast(
        msg: text,
        timeInSecForIosWeb: 2,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.grey[600],
        textColor: Colors.white,
        fontSize: 14);
  }

  @override
  Widget build(BuildContext context) {
    var ekrnbilgi = MediaQuery.of(context);
    final double yukseklik = ekrnbilgi.size.height;
    final double genislik = ekrnbilgi.size.width;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: yukseklik / 90,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Hesap Oluşturma,",
                          style: TextStyle(
                              fontSize: 26, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          "Tüm Alanları Eksksiz Doldurunuz.",
                          style: TextStyle(
                              fontSize: 20, color: Colors.grey.shade400),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: yukseklik / 70,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: genislik / 20),
              ),
              SizedBox(
                width: genislik / 1.1,
                child: TextField(
                  controller: isimsoyisim,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    labelText: "İsim Soyisim",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: genislik / 20),
              ),
              SizedBox(
                width: genislik / 1.1,
                child: TextField(
                  controller: isim,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    labelText: "Mail",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(yukseklik / 80),
                child: SizedBox(
                  width: genislik / 1.1,
                  child: TextField(
                    controller: sifre1,
                    obscureText: true,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      labelText: "Şifre",
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: genislik / 1.1,
                child: TextField(
                  controller: sifre2,
                  obscureText: true,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    labelText: "Şifre Tekrar",
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () {
                  //insertUser();
                },
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 1.1,
                  height: 35,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 17, 146, 0),
                    ),
                    child: const Text("Kayıt Ol"),
                    onPressed: () async {
                      await kullanicikayitet();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
