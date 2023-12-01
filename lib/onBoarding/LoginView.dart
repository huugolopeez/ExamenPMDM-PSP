import 'package:examen_pmdm/customViews/BotonCustom.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: BotonCustom(sText: 'hola', cBackgroundColor: const Color.fromRGBO(152, 45, 157, 1.0), cSideColor: const Color.fromRGBO(45, 12, 157, 1.0), event: null, cTextColor: const Color.fromRGBO(255, 255, 255, 1.0), dTamanoText: 20),
    );
  }

}