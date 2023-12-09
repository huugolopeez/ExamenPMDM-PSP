import 'package:examen_pmdm/customViews/BotonCustom.dart';
import 'package:examen_pmdm/customViews/CampoTextoCustom.dart';
import 'package:examen_pmdm/customViews/TextoCustom.dart';
import 'package:examen_pmdm/singletone/DataHolder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {

  late BuildContext _context;
  TextEditingController tecEmail = TextEditingController();
  TextEditingController tecPass = TextEditingController();

  throwSnackBar(String error) {
    SnackBar snackBar = SnackBar(content: Text(error));
    ScaffoldMessenger.of(_context).showSnackBar(snackBar);
  }

  Future<void> onLoginButton() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: tecEmail.text,
          password: tecPass.text
      );
      Navigator.of(_context).popAndPushNamed('/splashview');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        print(' --> Formato del email incorrecto.');
        throwSnackBar('-- Formato del email incorrecto --');
      } else if (e.code == 'invalid-login-credentials') {
        print(' --> Credenciales incorrectas.');
        throwSnackBar('-- Credenciales incorrectas --');
      }
    }
  }

  void onRegisterButton() {
    Navigator.of(_context).popAndPushNamed('/registerview');
  }

  @override
  Widget build(BuildContext context) {

    _context = context;

    return Scaffold(
      backgroundColor: DataHolder().colorFondo,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: TextoCustom(sText: 'LOGIN', dSize: 36, cTextColor: DataHolder().colorTerciario),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: CampoTextoCustom(
                sLabel: 'Username', tecController: tecEmail, iIcon: const Icon(Icons.account_circle_rounded)
              )),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: CampoTextoCustom(
                  sLabel: 'Password', tecController: tecPass, blIsPassword: true, iIcon: const Icon(Icons.password)
              )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BotonCustom(sText: 'Aceptar', event: onLoginButton, cTextColor: DataHolder().colorTerciario, cBackgroundColor: DataHolder().colorPrincipal, cSideColor: Colors.white, dTamanoText: 15),
                BotonCustom(sText: 'Register', event: onRegisterButton, cTextColor: DataHolder().colorTerciario, cBackgroundColor: DataHolder().colorSecundario, cSideColor: Colors.transparent, dTamanoText: 15),
              ]
            )
          ]
      ),
    );
  }

}