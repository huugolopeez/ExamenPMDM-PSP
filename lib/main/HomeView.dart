import 'package:examen_pmdm/customViews/TextoCustom.dart';
import 'package:flutter/material.dart';

import '../singletone/DataHolder.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: DataHolder().colorFondo,
        body: Center(
            child: TextoCustom(sText: 'HOME', dSize: 36, cTextColor: DataHolder().colorTerciario)
        )
    );
  }
}