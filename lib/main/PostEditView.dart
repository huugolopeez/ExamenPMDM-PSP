import 'dart:io';

import 'package:examen_pmdm/customViews/TextoCustom.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

import 'package:examen_pmdm/customViews/CampoTextoCustom.dart';
import 'package:examen_pmdm/firestoreObjects/FbPost.dart';
import 'package:examen_pmdm/singletone/DataHolder.dart';

class PostEditView extends StatefulWidget {

  @override
  State<PostEditView> createState() => _PostEditViewState();
}

class _PostEditViewState extends State<PostEditView> {

  TextEditingController tecTitle = TextEditingController();
  TextEditingController tecBody = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  File _imagenPreview = File('');
  bool isPhoto = false;

  void onBottomMenuPressed(int index) async {
    if(index == 0) {
      Navigator.of(context).popAndPushNamed('/homeview');
    } else if(index == 1) {
      Navigator.of(context).popAndPushNamed('/homeview');
    }
  }

  void onCameraButton() async {
    XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        _imagenPreview = File(image.path);
      });
    }
    isPhoto = true;
  }

  void onGalleryButton() async {
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if(image != null) {
      setState(() {
        _imagenPreview = File(image.path);
      });
    }
    isPhoto = true;
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
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () { onCameraButton(); },
                          child: Icon(Icons.camera_alt_rounded, color: DataHolder().colorPrincipal)
                      ),
                      TextButton(
                          onPressed: () { onGalleryButton(); },
                          child: Icon(Icons.image, color: DataHolder().colorPrincipal)
                      ),
                    ]),
              ),
            ]),
        bottomNavigationBar: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(onPressed: () => onBottomMenuPressed(0), child: TextoCustom(sText: 'Editar', dSize: 24, cTextColor: DataHolder().colorTerciario)),
              TextButton(onPressed: () => onBottomMenuPressed(1), child: TextoCustom(sText: 'Cancelar', dSize: 24, cTextColor: DataHolder().colorTerciario))
            ]
        )
    );
  }
}