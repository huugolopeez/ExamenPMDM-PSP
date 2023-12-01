import 'package:examen_pmdm/onBoarding/LoginView.dart';
import 'package:examen_pmdm/onBoarding/RegisterView.dart';
import 'package:examen_pmdm/splash/SplashView.dart';
import 'package:flutter/material.dart';

class Examen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      initialRoute: '/splashview',
      routes: {
        '/splashview': (context) => SplashView(),
        '/loginview': (context) => LoginView(),
        '/registerview': (context) => RegisterView()
      },
    );
  }
}