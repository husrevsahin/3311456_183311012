import 'package:flutter/material.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:mobil_uygulama/screen/hava_durumu.dart';
import 'package:mobil_uygulama/screen/menu.dart';
import 'package:mobil_uygulama/screen/profil.dart';
import 'package:mobil_uygulama/screen/uygulama_bilgileri.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = 0;
  }

  void changePage(int? index) {
    setState(() {
      currentIndex = index!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: currentIndex == 0
            ? menu()
            : currentIndex == 1
                ? kullanici_bilgi()
                : hakkinda(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => WeatherWidget()));
        },
        child: Icon(IconData(0xf0576, fontFamily: 'MaterialIcons')),
        backgroundColor: Color.fromARGB(255, 8, 56, 4),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BubbleBottomBar(
        hasNotch: true,
        fabLocation: BubbleBottomBarFabLocation.end,
        opacity: .2,
        currentIndex: currentIndex,
        onTap: changePage,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
        elevation: 8,
        tilesPadding: EdgeInsets.symmetric(
          vertical: 8.0,
        ),
        items: <BubbleBottomBarItem>[
          BubbleBottomBarItem(
            backgroundColor: Color.fromARGB(255, 18, 206, 65),
            icon: Icon(
              Icons.menu,
              color: Colors.black,
            ),
            activeIcon: Icon(
              Icons.menu,
              color: Colors.black,
            ),
            title: Text("Menu"),
          ),
          BubbleBottomBarItem(
            backgroundColor: Color.fromARGB(255, 18, 206, 65),
            icon: Icon(
              IconData(0xf522, fontFamily: 'MaterialIcons'),
              color: Colors.black,
            ),
            activeIcon: Icon(
              IconData(0xf522, fontFamily: 'MaterialIcons'),
              color: Colors.black,
            ),
            title: Text("Profil"),
          ),
          BubbleBottomBarItem(
              backgroundColor: Color.fromARGB(255, 18, 206, 65),
              icon: Icon(
                IconData(0xf128, fontFamily: 'MaterialIcons'),
                color: Colors.black,
              ),
              activeIcon: Icon(
                IconData(0xf128, fontFamily: 'MaterialIcons'),
                color: Colors.black,
              ),
              title: Text("Hakkında")),
        ],
      ),
    );
  }
}
