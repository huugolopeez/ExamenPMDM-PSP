import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../customViews/BotonCustom.dart';
import '../customViews/CampoTextoCustom.dart';
import '../customViews/TextoCustom.dart';
import '../singletone/DataHolder.dart';

class RegisterView extends StatelessWidget {

  late BuildContext _context;
  TextEditingController tecEmail = TextEditingController();
  TextEditingController tecPass = TextEditingController();
  TextEditingController tecRepass = TextEditingController();

  throwSnackBar(String error) {
    SnackBar snackBar = SnackBar(content: Text(error));
    ScaffoldMessenger.of(_context).showSnackBar(snackBar);
  }

  void onCancelButton() {
    Navigator.of(_context).popAndPushNamed('/loginview');
  }

  Future<void> onRegisterButton() async {
    if(tecPass.text == tecRepass.text) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: tecEmail.text,
            password: tecPass.text
        );
        Navigator.of(_context).popAndPushNamed('/splashview');
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print(' --> La contraseña es muy debil.');
          throwSnackBar('-- La contraseña es muy debil --');
        } else if (e.code == 'email-already-in-use') {
          print(' --> El correo electronico ya esta en uso.');
          throwSnackBar('-- El correo electronico ya esta en uso --');
        }
      } catch (e) {
        print(e);
      }
    } else {
      print(' --> Las contraseñas no coinciden.');
      throwSnackBar('-- Las contraseñas no coinciden --');
    }
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
              child: TextoCustom(sText: 'REGISTER', dSize: 36, cTextColor: DataHolder().colorTerciario),
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
            Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: CampoTextoCustom(
                    sLabel: 'Confirm Password', tecController: tecRepass, blIsPassword: true, iIcon: const Icon(Icons.password)
                )),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BotonCustom(sText: 'Aceptar', event: onRegisterButton, cTextColor: DataHolder().colorTerciario, cBackgroundColor: DataHolder().colorPrincipal, cSideColor: Colors.white, dTamanoText: 15),
                  BotonCustom(sText: 'Cancelar', event: onCancelButton, cTextColor: DataHolder().colorTerciario, cBackgroundColor: DataHolder().colorSecundario, cSideColor: Colors.transparent, dTamanoText: 15),
                ]
            )
          ]
      ),
    );
  }

}