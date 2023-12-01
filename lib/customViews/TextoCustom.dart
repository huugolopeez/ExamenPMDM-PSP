import 'package:flutter/material.dart';

class TextoCustom extends StatelessWidget {

  String sText;
  double dSize;
  Color cTextColor;

  TextoCustom({Key? key,
    required this.sText,
    required this.dSize,
    required this.cTextColor,
  }) : super(key : key);

  @override
  Widget build(BuildContext context) {

    return Flexible(
        child: Text(
          sText,
          style: TextStyle(
            color: cTextColor,
            fontSize: dSize,
          ))
    );
  }

}