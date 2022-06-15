import 'package:flutter/material.dart';
import 'package:mobil_uygulama/screen/ilan_ekle.dart';
import 'package:mobil_uygulama/screen/ilanlar_bireysel.dart';
import 'package:mobil_uygulama/screen/ilanlar_mekan.dart';
import 'package:mobil_uygulama/screen/ilanlar_kayip.dart';

class menu extends StatefulWidget {
  @override
  State<menu> createState() => _menuState();
}

class _menuState extends State<menu> {
  @override
  Widget build(BuildContext context) {
    var ekrnbilgi = MediaQuery.of(context);
    final double yukseklik = ekrnbilgi.size.height;
    final double genislik = ekrnbilgi.size.width;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => yeni(),
                        ),
                      );
                    },
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 17, 146, 0),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            IconData(0xe749, fontFamily: 'MaterialIcons'),
                            color: Colors.white,
                            size: 40,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Kayıp İlanı",
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ),
                        ],
                      )),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => ilanlar_bireysel(),
                        ),
                      );
                    },
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 17, 146, 0),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            IconData(0xee35, fontFamily: 'MaterialIcons'),
                            color: Colors.white,
                            size: 40,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Bireysel İlanlar",
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ),
                        ],
                      )),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => ilanlar_mekan(),
                        ),
                      );
                    },
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 17, 146, 0),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            IconData(0xe040, fontFamily: 'MaterialIcons'),
                            color: Colors.white,
                            size: 40,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Kurumsal İlanlar",
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ),
                        ],
                      )),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => ilan_ekle(),
                        ),
                      );
                    },
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 17, 146, 0),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            IconData(0xe047, fontFamily: 'MaterialIcons'),
                            color: Colors.white,
                            size: 40,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "İlan Ekle",
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ),
                        ],
                      )),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
