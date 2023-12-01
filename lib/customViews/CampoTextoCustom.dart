import 'package:flutter/material.dart';

class CampoTextoCustom extends StatelessWidget {

  TextEditingController tecController;
  String sLabel;
  bool blIsPassword;
  Color cBoxColor;
  Icon iIcon;

  CampoTextoCustom({Key? key,
    required this.sLabel,
    required this.tecController,
    this.cBoxColor = Colors.white,
    required this.iIcon,
    this.blIsPassword = false,
  }) : super(key : key);

  @override
  Widget build(BuildContext context) {

    return Flexible(
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: cBoxColor),
          child: TextFormField(
              controller: tecController,
              obscureText: blIsPassword,
              decoration: InputDecoration(
                  icon: Padding(padding: const EdgeInsets.only(left: 10), child: iIcon),
                  hoverColor: cBoxColor,
                  border: const OutlineInputBorder(),
                  hintText: sLabel,
              )),
        ));
  }

}