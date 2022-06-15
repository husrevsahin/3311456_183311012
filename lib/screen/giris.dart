import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobil_uygulama/main.dart';
import 'package:mobil_uygulama/screen/home.dart';
import 'package:mobil_uygulama/screen/kayit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class AAAA extends StatefulWidget {
  @override
  State<AAAA> createState() => _AAAAState();
}

class _AAAAState extends State<AAAA> {
  TextEditingController email = TextEditingController();
  TextEditingController sifre = TextEditingController();

  girisislemi() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email.text, password: sifre.text)
          .then((kullanici) {
        Navigator.push(
                context, MaterialPageRoute(builder: (context) => MyHomePage()))
            .catchError((dynamic error) {});
      });
    } on Exception catch (_) {
      _buildHataMesaji("Bir Şeyler Yanlış Gitti \nLütfen Tekrar Deneyiniz");
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
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: yukseklik / 90,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.1,
                    child: Text(
                      "Hoşgeldiniz,",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
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
                  controller: email,
                  decoration: InputDecoration(
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
                    controller: sifre,
                    obscureText: true,
                    decoration: InputDecoration(
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
                width: MediaQuery.of(context).size.width / 1.1,
                height: 35,
                child: ElevatedButton(
                  child: Text(
                    "Giriş",
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 17, 146, 0),
                  ),
                  onPressed: () {
                    girisislemi();
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.1,
                height: 35,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 17, 146, 0),
                  ),
                  child: Text("Kayıt Ol"),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => kayit()));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
