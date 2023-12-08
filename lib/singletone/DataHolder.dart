import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../firestoreObjects/FbPost.dart';
import '../firestoreObjects/FbUsuario.dart';
import 'FirebaseAdmin.dart';

class DataHolder {

  static final DataHolder _dataHolder = DataHolder._internal();

  FirebaseFirestore db = FirebaseFirestore.instance;
  FirebaseAdmin fbAdmin = FirebaseAdmin();

  late Color colorFondo;
  late Color colorPrincipal;
  late Color colorSecundario;
  late Color colorTerciario;

  late FbPost selectedPost;
  late FbUsuario selectedUser;

  DataHolder._internal() {
    initCache();
  }

  factory DataHolder() {
    return _dataHolder;
  }

  void initCache() {
    loadColors();
  }

  void loadColors() {
    colorFondo = const Color.fromRGBO(46, 40, 40, 1.0);
    colorPrincipal = const Color.fromRGBO(246, 81, 81, 1.0);
    colorSecundario = const Color.fromRGBO(80, 58, 58, 1.0);
    colorTerciario = const Color.fromRGBO(254, 244, 244, 1.0);
  }
}