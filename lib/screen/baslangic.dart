import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:mobil_uygulama/screen/giris.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/indir.jpg'),
            ),
            borderRadius: BorderRadius.all(Radius.circular(30))),
      ),
      nextScreen: AAAA(),
      duration: 3000,
      splashTransition: SplashTransition.rotationTransition,
      backgroundColor: Colors.black45,
    );
  }
}
