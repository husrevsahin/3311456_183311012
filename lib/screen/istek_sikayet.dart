import 'package:flutter/material.dart';
import 'package:mobil_uygulama/screen/home.dart';
import 'package:mobil_uygulama/screen/menu.dart';

class istek_sikayet extends StatefulWidget {
  @override
  State<istek_sikayet> createState() => _istek_sikayetState();
}

class _istek_sikayetState extends State<istek_sikayet> {
  @override
  Widget build(BuildContext context) {
    var ekrnbilgi = MediaQuery.of(context);
    final double yukseklik = ekrnbilgi.size.height;
    final double genislik = ekrnbilgi.size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 209, 146),
        title: Text("İSTEK VE ŞİKAYETLERİNİZ"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: yukseklik / 20),
                child: SizedBox(
                  width: genislik / 1.17,
                  child: TextField(
                    maxLines: 5,
                    maxLength: 600,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: yukseklik / 25),
                child: SizedBox(
                  width: genislik / 2,
                  child: ElevatedButton(
                      child: Text("gönder"),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 17, 146, 0),
                      ),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: new Text("Kaydedilmiştir"),
                                content: new Text(
                                    "Geribildiriminiz için teşekkür ederiz. Düşünceleriniz dikkate alınacaktır"),
                                actions: [
                                  new TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MyHomePage()),
                                      );
                                    },
                                    child: new Text("Menüye Dön"),
                                  ),
                                ],
                              );
                            });
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
