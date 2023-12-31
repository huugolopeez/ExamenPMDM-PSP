import 'package:examen_pmdm/main/AjustesView.dart';
import 'package:examen_pmdm/main/HomeView.dart';
import 'package:examen_pmdm/main/PostView.dart';
import 'package:examen_pmdm/onBoarding/LoginView.dart';
import 'package:examen_pmdm/onBoarding/PerfilView.dart';
import 'package:examen_pmdm/onBoarding/RegisterView.dart';
import 'package:examen_pmdm/splash/SplashView.dart';
import 'package:flutter/material.dart';

import 'main/PostCreateView.dart';
import 'main/PostEditView.dart';

class Examen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Examen',
      debugShowCheckedModeBanner: false,
      initialRoute: '/splashview',
      routes: {
        '/splashview': (context) => SplashView(),
        '/loginview': (context) => LoginView(),
        '/registerview': (context) => RegisterView(),
        '/perfilview': (context) => PerfilView(),
        '/homeview': (context) => HomeView(),
        '/ajustesview': (context) => AjustesView(),
        '/postview': (context) => PostView(),
        '/posteditview': (context) => PostEditView(),
        '/postcreateview': (context) => PostCreateView()
      },
    );
  }
}