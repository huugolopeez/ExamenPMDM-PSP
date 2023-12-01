import 'package:examen_pmdm/customViews/BotonCustom.dart';
import 'package:examen_pmdm/customViews/CampoTextoCustom.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {

  TextEditingController tc = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        children: [
          CampoTextoCustom(sLabel: 'yeyeyeey', tecController: tc, cBoxColor: Colors.amberAccent, iIcon: const Icon(Icons.abc)),
          BotonCustom(sText: 'hola', cBackgroundColor: Colors.deepPurple, cSideColor: Colors.white, event: null, cTextColor: Colors.white, dTamanoText: 20),
        ]
      )
    );
  }

}