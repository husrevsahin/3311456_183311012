import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobil_uygulama/screen/Kisi_ilanlari.dart';
import 'package:mobil_uygulama/screen/giris.dart';

class foto_islem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return kullanici_bilgi();
  }
}

class kullanici_bilgi extends StatefulWidget {
  @override
  State<kullanici_bilgi> createState() => _kullanici_bilgiState();
}

class _kullanici_bilgiState extends State<kullanici_bilgi> {
  File? _secilenDosya;
  TextEditingController isimsoyisim = new TextEditingController();
  TextEditingController biografi = new TextEditingController();
  TextEditingController ilanBaslik = TextEditingController();
  FirebaseStorage storage = FirebaseStorage.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  String? indirmebaglantisi;

  var gelenisimsoyisim = "";

  biografiEkle() {
    FirebaseFirestore.instance
        .collection("Kullanicilar")
        .doc(auth.currentUser!.email!)
        .update({"biografi": biografi.text}).then(
            (value) => _buildMesaj("biografiniz eklendi"));
  }

  @override
  void initState() {
    resimyol();
    isimgetir();
    super.initState();
  }

  void _buildMesaj(String text) {
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
    ///

    ///

    var ekrnbilgi = MediaQuery.of(context);
    final double yukseklik = ekrnbilgi.size.height;
    final double genislik = ekrnbilgi.size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 17, 146, 0),
        title: Text("profilini düzenle"),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut().then((value) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => AAAA(),
                    ),
                  );
                });
              },
              icon: Icon(Icons.exit_to_app))
        ],
      ),
      body: isloladPgae
          ? ListView(
              children: [
                SizedBox(
                  height: yukseklik / 50,
                ),
                Center(
                  child: CircleAvatar(
                    child: resimVarMi
                        ? null
                        : (_secilenDosya == null ? Text("Fotoğraf") : null),
                    radius: 50,
                    backgroundColor: Color.fromARGB(255, 131, 232, 118),
                    backgroundImage: resimVarMi
                        ? NetworkImage(indirmeLinki!) as ImageProvider
                        : (_secilenDosya == null
                            ? null
                            : FileImage(new File(_secilenDosya!.path))),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: yukseklik / 55, left: 50, right: 50),
                  child: SizedBox(
                    width: genislik / 50,
                    child: ElevatedButton(
                      onPressed: () {
                        _secimFotoGoster(context);
                      },
                      child: Text("Fotoğraf Yükle"),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 17, 146, 0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: genislik / 20, left: 170),
                  child: Text(gelenisimsoyisim),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: yukseklik / 50, left: 50, right: 50),
                  child: SizedBox(
                    width: genislik / 1.17,
                    child: TextField(
                      controller: biografi,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(0, 96, 125, 139),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        labelText: "Biografinizi giriniz",
                      ),
                      maxLines: 5,
                      maxLength: 200,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: yukseklik / 99, left: 50, right: 50),
                  child: SizedBox(
                    width: genislik / 50,
                    child: ElevatedButton(
                      onPressed: () {
                        biografiEkle();
                      },
                      child: Text("Ekle/Güncelle"),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 17, 146, 0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: yukseklik / 99, left: 50, right: 50),
                  child: SizedBox(
                    width: genislik / 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => kisiilanlari(),
                          ),
                        );
                      },
                      child: Text("İlanlarım"),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 17, 146, 0),
                      ),
                    ),
                  ),
                ),
              ],
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  String? indirmeLinki = null;
  bool resimVarMi = false;
  void resimyol() async {
    try {
      indirmeLinki = await FirebaseStorage.instance
          .ref()
          .child("profilresimleri")
          .child(auth.currentUser!.email!)
          .child("profilresmmi.png")
          .getDownloadURL();
      resimVarMi = true;
    } on Exception catch (_) {
      resimVarMi = false;
    }
    if (this.mounted) {
      setState(() {});
    }
  }

  bool isloladPgae = false;
  Future<void> isimgetir() async {
    await FirebaseFirestore.instance
        .collection("Kullanicilar")
        .doc(auth.currentUser!.email)
        .get()
        .then((gelenisim) {
      setState(() {
        gelenisimsoyisim = gelenisim.data()!["İsimSoyisim"];
        biografi.text = gelenisim.data()!["biografi"];
        isloladPgae = true;
      });
    });
  }

  void _secimFotoGoster(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text("Galeriden Fotoğref Seç"),
              onTap: () {
                _secimYukleGaleri(ImageSource.gallery);
              },
            ),
            ListTile(
              title: Text("Kameradan Fotoğraf Çek"),
              onTap: () {
                _secimYukleKamera(ImageSource.camera);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _secimYukleKamera(ImageSource source) async {
    var secilen = await ImagePicker().pickImage(source: source);
    setState(() {
      if (secilen != null) {
        _secilenDosya = File(secilen.path);
      }
    });
    Navigator.of(context).pop();
/*   */
    Reference refyol = FirebaseStorage.instance
        .ref()
        .child('profilresimleri')
        .child(auth.currentUser?.email ?? "")
        .child('profilresmmi.png');
    UploadTask yuklemeGorevi = refyol.putFile(_secilenDosya!);
    String url = await (await yuklemeGorevi).ref.getDownloadURL();
    setState(() {
      indirmebaglantisi = url;
    });
  }

  void _secimYukleGaleri(ImageSource source) async {
    var secilen = await ImagePicker().pickImage(source: source);
    setState(() {
      if (secilen != null) {
        _secilenDosya = File(secilen.path);
      }
    });
    Navigator.of(context).pop();

    Reference refyol = FirebaseStorage.instance
        .ref()
        .child('profilresimleri')
        .child(auth.currentUser?.email ?? "")
        .child('profilresmmi.png');

    UploadTask yuklemeGorevi = refyol.putFile(_secilenDosya!);
    String url = await (await yuklemeGorevi).ref.getDownloadURL();
    setState(() {
      indirmebaglantisi = url;
    });
  }
}
