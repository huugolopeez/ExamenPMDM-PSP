import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../customViews/CampoTextoCustom.dart';
import '../customViews/TextoCustom.dart';
import '../firestoreObjects/FbPost.dart';
import '../singletone/DataHolder.dart';

class PostCreateView extends StatefulWidget {

  @override
  State<PostCreateView> createState() => _PostCreateViewState();
}

class _PostCreateViewState extends State<PostCreateView> {

  TextEditingController tecTitle = TextEditingController();
  TextEditingController tecBody = TextEditingController();

  void onBottomMenuPressed(int index) async {
    if(index == 0) {
      DataHolder().fbAdmin.insertPost(FbPost(titulo: tecTitle.text, cuerpo: tecBody.text));
      Navigator.of(context).popAndPushNamed('/homeview');
    } else if(index == 1) {
      Navigator.of(context).popAndPushNamed('/homeview');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: DataHolder().colorFondo,
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                  child: CampoTextoCustom(
                      sLabel: 'Escribe un titulo', tecController: tecTitle, iIcon: const Icon(Icons.title))
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                  child: CampoTextoCustom(
                      sLabel: 'Escribe un cuerpo', tecController: tecBody, iIcon: const Icon(Icons.drive_file_rename_outline_sharp))
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(onPressed: () => onBottomMenuPressed(0), child: TextoCustom(sText: 'Crear', dSize: 24, cTextColor: DataHolder().colorTerciario)),
                    TextButton(onPressed: () => onBottomMenuPressed(1), child: TextoCustom(sText: 'Cancelar', dSize: 24, cTextColor: DataHolder().colorTerciario))
                  ]
              )
            ])
    );
  }
}