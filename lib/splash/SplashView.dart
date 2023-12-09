import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../firestoreObjects/FbUsuario.dart';
import '../singletone/DataHolder.dart';

class SplashView extends StatefulWidget {

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    checkSession();
  }

  FirebaseFirestore db = FirebaseFirestore.instance;

  Future<void> checkSession() async {
    await Future.delayed(const Duration(seconds: 4));
    if (FirebaseAuth.instance.currentUser != null) {
      String uid = FirebaseAuth.instance.currentUser!.uid;
      DocumentReference<FbUsuario> reference = db.collection("Usuarios").doc(uid).withConverter(fromFirestore: FbUsuario.fromFirestore, toFirestore: (FbUsuario usuario, _) => usuario.toFirestore());
      DocumentSnapshot<FbUsuario> docSnap = await reference.get();
      FbUsuario? usuario = docSnap.data();

      if(usuario != null) {
        DataHolder().selectedUser = usuario;
        DataHolder().saveSelectedUserInCache();
        Navigator.of(context).popAndPushNamed('/homeview');
      } else {
        Navigator.of(context).popAndPushNamed('/perfilview');
      }
    } else {
      Navigator.of(context).popAndPushNamed('/loginview');
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: DataHolder().colorFondo,
        body: const Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator()
                ]
            )
        )
    );
  }
}