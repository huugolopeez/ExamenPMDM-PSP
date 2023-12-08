import 'package:flutter/material.dart';

import '../customViews/TextoCustom.dart';
import '../singletone/DataHolder.dart';

class AjustesView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: DataHolder().colorFondo,
      body: Center(
        child: TextoCustom(sText: 'AJUSTES', dSize: 36, cTextColor: DataHolder().colorTerciario)
      )
    );
  }
}