import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class kisi_bilgisi extends StatefulWidget {
  String email;

  kisi_bilgisi({required this.email});

  @override
  State<kisi_bilgisi> createState() => _kisi_bilgisiState();
}

class _kisi_bilgisiState extends State<kisi_bilgisi> {
  @override
  void initState() {
    resimyol();
    isimgetir();
    super.initState();
  }

  String gelenisimsoyisim = "";
  String biografi = "";
  FirebaseAuth auth = FirebaseAuth.instance;

  bool isloladPgae = false;
  Future<void> isimgetir() async {
    await FirebaseFirestore.instance
        .collection("Kullanicilar")
        .doc(widget.email)
        .get()
        .then((gelenisim) {
      setState(() {
        gelenisimsoyisim = gelenisim.data()!["İsimSoyisim"];
        biografi = gelenisim.data()!["biografi"];
        isloladPgae = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var ekrnbilgi = MediaQuery.of(context);
    final double yukseklik = ekrnbilgi.size.height;
    final double genislik = ekrnbilgi.size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 17, 146, 0),
        title: Text("Kişi Bilgileri"),
        centerTitle: true,
      ),
      body: isloadPage
          ? SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: genislik / 20, left: genislik / 100),
                      child: SizedBox(
                        width: genislik / 4,
                        child: indirmeLinki == null
                            ? LinearProgressIndicator()
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  indirmeLinki!,
                                ),
                              ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: genislik / 20),
                      child: Text(gelenisimsoyisim),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: genislik / 20),
                      child: Center(
                        child: Container(
                          width: genislik / 1.1,
                          height: yukseklik / 5,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 128, 212, 117),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(child: Text(biografi)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  String? indirmeLinki = null;
  bool isloadPage = false;
  void resimyol() async {
    try {
      indirmeLinki = await FirebaseStorage.instance
          .ref()
          .child("profilresimleri")
          .child(widget.email)
          .child("profilresmmi.png")
          .getDownloadURL();
      setState(() {});
    } catch (e) {
      indirmeLinki =
          "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png";
    }
    isloadPage = true;
    setState(() {});
  }
}
