import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:examen_pmdm/customViews/CampoTextoCustom.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../customViews/BotonCustom.dart';
import '../firestoreObjects/FbUsuario.dart';
import '../singletone/DataHolder.dart';

class PerfilView extends StatelessWidget {

  late BuildContext _context;
  FirebaseFirestore db = FirebaseFirestore.instance;
  TextEditingController tecName = TextEditingController();
  TextEditingController tecAge = TextEditingController();

  Future<void> onClickAceptar() async {

    FbUsuario usuario = FbUsuario(nombre: tecName.text, edad: int.parse(tecAge.text));

    String uidUser = FirebaseAuth.instance.currentUser!.uid;
    await db.collection("Usuarios").doc(uidUser).set(usuario.toFirestore());
    Navigator.of(_context).popAndPushNamed('/splashview');
  }

  void onClickCancelar() {
    Navigator.of(_context).popAndPushNamed('/loginview');
  }

  @override
  Widget build(BuildContext context) {

    _context = context;

    return Scaffold(
        backgroundColor: DataHolder().colorFondo,
        appBar: AppBar(
            title: const Text('Perfil'),
            centerTitle: true,
            backgroundColor: DataHolder().colorPrincipal
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                  child: CampoTextoCustom(
                      sLabel: 'Nombre', tecController: tecName, iIcon: const Icon(Icons.drive_file_rename_outline_sharp)
                  )),
              Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                  child: CampoTextoCustom(
                      sLabel: 'Edad', tecController: tecAge, iIcon: const Icon(Icons.drive_file_rename_outline_sharp)
                  )),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BotonCustom(sText: 'Aceptar', event: onClickAceptar, cTextColor: DataHolder().colorTerciario, cBackgroundColor: DataHolder().colorPrincipal, cSideColor: Colors.white, dTamanoText: 15),
                    BotonCustom(sText: 'Register', event: onClickCancelar, cTextColor: DataHolder().colorTerciario, cBackgroundColor: DataHolder().colorSecundario, cSideColor: Colors.transparent, dTamanoText: 15),
                  ]
              )
            ]
        )
    );
  }
}