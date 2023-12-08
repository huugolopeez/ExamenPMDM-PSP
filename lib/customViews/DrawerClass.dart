import 'package:flutter/material.dart';

import '../singletone/DataHolder.dart';

class DrawerClass extends StatelessWidget {

  final Function(int indice)? onItemTap;

  const DrawerClass({super.key,
    required this.onItemTap
  });

  @override
  Widget build(BuildContext context) {

    return Drawer(
        backgroundColor: DataHolder().colorFondo,
        child: ListView(
            children: [
              const DrawerHeader(
                  child: Column(
                      children: [
                        Padding(
                            padding: EdgeInsets.fromLTRB(10, 60, 10, 10),
                            child: Row(
                                children: [
                                  Padding(
                                      padding: EdgeInsets.only(right: 10),
                                      child: Icon(Icons.account_circle)
                                  ),
                                  Text(
                                      'Nombre Usuario',
                                      style: TextStyle(color: Colors.white)
                                  )
                                ])
                        ),
                        Padding(
                            padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
                            child: Row(
                                children: [
                                  Padding(
                                      padding:  EdgeInsets.only(right: 10),
                                      child: Text(
                                          '2050 seguidores',
                                          style: TextStyle(color: Colors.white)
                                      )
                                  ),
                                  Text(
                                      '2000 seguidos',
                                      style: TextStyle(color: Colors.white)
                                  )
                                ])
                        )
                      ])
              ),
              ListTile(
                  leading: const Icon(Icons.ac_unit_rounded, color: Colors.white),
                  selectedColor: DataHolder().colorPrincipal,
                  onTap: () { onItemTap!(0); },
                  title: const Text(
                      'Salir de la cuenta',
                      style: TextStyle(color: Colors.white)
                  )
              ),
              ListTile(
                  leading: const Icon(Icons.accessible_forward_sharp, color: Colors.white),
                  selectedColor: DataHolder().colorPrincipal,
                  onTap: () { onItemTap!(1); },
                  title: const Text(
                      'Ajustes',
                      style: TextStyle(color: Colors.white)
                  )
              )
            ])
    );
  }
}