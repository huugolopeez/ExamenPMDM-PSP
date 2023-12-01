import 'package:examen_pmdm/customViews/BotonCustom.dart';
import 'package:examen_pmdm/customViews/CampoTextoCustom.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {

  TextEditingController tecEmail = TextEditingController();
  TextEditingController tecPass = TextEditingController();

  void onLoginButton() {

  }

  void onRegisterButton() {

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
          title: const Text('Login'),
          centerTitle: true,
          backgroundColor: Colors.transparent
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
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
                BotonCustom(sText: 'Login', event: onLoginButton, cTextColor: Colors.white, cBackgroundColor: Colors.deepPurple, cSideColor: Colors.white, dTamanoText: 15),
                BotonCustom(sText: 'Login', event: onRegisterButton, cTextColor: Colors.white, cBackgroundColor: Colors.transparent, cSideColor: Colors.transparent, dTamanoText: 15),
              ],
            )
          ]
      ),
    );
  }

}