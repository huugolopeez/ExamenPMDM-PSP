import 'package:examen_pmdm/customViews/TextoCustom.dart';
import 'package:flutter/material.dart';

class BotonCustom extends StatelessWidget {

  Function(int indice)? event;
  String sText;
  double dTamanoText;
  Color cBackgroundColor;
  Color cSideColor;
  Color cTextColor;

  BotonCustom({Key? key,
    required this.sText,
    required this.dTamanoText,
    required this.cBackgroundColor,
    required this.cSideColor,
    required this.cTextColor,
    this.event
  }) : super(key : key);

  @override
  Widget build(BuildContext context) {

    return ConstrainedBox(
        constraints: const BoxConstraints.tightFor(width: 150, height: 50),
        child: ElevatedButton(
            onPressed: () => event!(0),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(cBackgroundColor),
                side: MaterialStateProperty.all(BorderSide(color: cSideColor)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)
                    ))),
            child: TextoCustom(sText: sText, dSize: dTamanoText, cTextColor: cTextColor)
        ));
  }
}