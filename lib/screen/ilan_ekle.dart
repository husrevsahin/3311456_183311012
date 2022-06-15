import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobil_uygulama/screen/home.dart';
import 'package:mobil_uygulama/screen/menu.dart';

class ilan_ekle extends StatefulWidget {
  @override
  State<ilan_ekle> createState() => _ilan_ekleState();
}

class _ilan_ekleState extends State<ilan_ekle> {
  int? radioDeger = 0;

  TextEditingController name = new TextEditingController();
  TextEditingController content = new TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  TextEditingController ilanBaslik = TextEditingController();
  TextEditingController ilanIcerik = TextEditingController();
  TextEditingController rdbSecili = TextEditingController();

  void _builddialogkayip(String mesaj1) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("İlan Oluşturuldu"),
            content: new Text(mesaj1),
            actions: [
              new TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage()),
                  );
                },
                child: new Text("kapat"),
              ),
            ],
          );
        });
  }

  void _builddialogbireysel(String mesaj1) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("İlan Oluşturuldu"),
            content: new Text(mesaj1),
            actions: [
              new TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage()),
                  );
                },
                child: new Text("kapat"),
              ),
            ],
          );
        });
  }

  void _builddialogkurumsal(String mesaj1) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("İlan Oluşturuldu"),
            content: new Text(mesaj1),
            actions: [
              new TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage()),
                  );
                },
                child: new Text("kapat"),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    var ekrnbilgi = MediaQuery.of(context);
    final double yukseklik = ekrnbilgi.size.height;
    final double genislik = ekrnbilgi.size.width;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 209, 146),
        title: Text("İlan Ekleme"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: genislik,
                height: yukseklik / 20,
                child: RadioListTile(
                  title: Text("kayıp"),
                  value: 1,
                  groupValue: radioDeger,
                  onChanged: (int? veri) {
                    setState(() {
                      radioDeger = veri;
                    });
                  },
                ),
              ),
              SizedBox(
                width: genislik,
                height: yukseklik / 20,
                child: RadioListTile(
                  title: Text("bireysel"),
                  value: 2,
                  groupValue: radioDeger,
                  onChanged: (int? veri) {
                    setState(() {
                      radioDeger = veri;
                    });
                  },
                ),
              ),
              SizedBox(
                width: genislik,
                height: yukseklik / 20,
                child: RadioListTile(
                  title: Text("kurumsal"),
                  value: 3,
                  groupValue: radioDeger,
                  onChanged: (int? veri) {
                    setState(() {
                      radioDeger = veri;
                    });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: yukseklik / 20),
                child: SizedBox(
                  width: genislik / 1.17,
                  height: yukseklik / 10,
                  child: TextField(
                    controller: ilanBaslik,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color.fromARGB(0, 96, 125, 139),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      labelText: "İlan Başlığı",
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: yukseklik / 20),
                child: SizedBox(
                  width: genislik / 1.17,
                  child: TextField(
                    controller: ilanIcerik,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color.fromARGB(0, 96, 125, 139),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      labelText: "İlan Açıklaması",
                    ),
                    maxLines: 5,
                    maxLength: 200,
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: yukseklik / 20, right: 30, left: 30),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 1.1,
                  height: 35,
                  child: ElevatedButton(
                    child: Text("Kaydet"),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 17, 146, 0),
                    ),
                    onPressed: () {
                      if (radioDeger == 1) {
                        FirebaseFirestore.instance
                            .collection("Kayip_ilanlar")
                            .doc(ilanBaslik.text)
                            .set({
                          "kullaniciid": auth.currentUser?.email,
                          "başlık": ilanBaslik.text,
                          "açıklama": ilanIcerik.text
                        }).then((value) => _builddialogkayip(
                                "${ilanBaslik.text} başlıklı ilanınız oluşturuldu."));
                      } else if (radioDeger == 2) {
                        FirebaseFirestore.instance
                            .collection("Bireysel_ilanlar")
                            .doc(ilanBaslik.text)
                            .set({
                          "kullaniciid": auth.currentUser?.email,
                          "başlık": ilanBaslik.text,
                          "açıklama": ilanIcerik.text
                        }).then((value) => _builddialogbireysel(
                                "${ilanBaslik.text} başlıklı ilanınız oluşturuldu."));
                      } else if (radioDeger == 3) {
                        FirebaseFirestore.instance
                            .collection("Kurumsal_ilanlar")
                            .doc(ilanBaslik.text)
                            .set({
                          "kullaniciid": auth.currentUser?.email,
                          "başlık": ilanBaslik.text,
                          "açıklama": ilanIcerik.text
                        }).then((value) => _builddialogkurumsal(
                                "${ilanBaslik.text} başlıklı ilanınız oluşturuldu."));
                      } else {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: new Text("Uyarı"),
                                content:
                                    new Text("İlan Katagorisi Boş Geçilemez."),
                                actions: [
                                  new TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: new Text("Tamam"),
                                  ),
                                ],
                              );
                            });
                      }
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
