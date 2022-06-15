import 'package:flutter/material.dart';
import 'package:mobil_uygulama/screen/kisi_bilgisi.dart';
import 'package:mobil_uygulama/screen/kisiler_ekrani.dart';

class ilan_biilgileri extends StatefulWidget {
  String aciklama;
  String email;
  String baslik;

  ilan_biilgileri(
      {required this.aciklama, required this.email, required this.baslik});

  @override
  State<ilan_biilgileri> createState() => _ilan_biilgileriState();
}

class _ilan_biilgileriState extends State<ilan_biilgileri> {
  @override
  Widget build(BuildContext context) {
    var ekrnbilgi = MediaQuery.of(context);
    final double yukseklik = ekrnbilgi.size.height;
    final double genislik = ekrnbilgi.size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 17, 146, 0),
        title: Text("İlan Bilgileri"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: genislik / 20),
                child: Center(
                  child: Container(
                    width: genislik / 1.1,
                    height: yukseklik / 2,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 128, 212, 117),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(child: Text(widget.aciklama)),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: genislik / 10),
                child: SizedBox(
                  width: genislik / 1.1,
                  child: ElevatedButton(
                    child: Text(
                      "İlan Veren Kişi Hakkında",
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 17, 146, 0),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => kisi_bilgisi(
                                    email: widget.email,
                                  )));
                    },
                  ),
                ),
              ),
              SizedBox(
                width: genislik / 1.1,
                child: ElevatedButton(
                  child: Text(
                    "Katıl",
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 17, 146, 0),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
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
