import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:examen_pmdm/customViews/TextoCustom.dart';
import 'package:flutter/material.dart';

import '../customViews/PostCellView.dart';
import '../customViews/PostGridView.dart';
import '../firestoreObjects/FbPost.dart';
import '../singletone/DataHolder.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  final List<FbPost> posts = [];
  bool bIsList = false;

  @override
  void initState() {
    super.initState();
    getPosts();
  }

  void getPosts() async {
    QuerySnapshot<FbPost> querySnap = await DataHolder().fbAdmin.getPosts();

    for(int i = 0 ; i < querySnap.docs.length ; i++) {
      setState(() {
        posts.add(querySnap.docs[i].data());
      });
    }
  }

  Widget? gridOrList(bool bIsList) {
    if(bIsList) {
      return ListView.separated(
          padding: const EdgeInsets.all(20),
          itemCount: posts.length,
          itemBuilder: (context, index) {
            return PostCellView(
                sTitle: posts[index].titulo,
                sBody: posts[index].cuerpo,
                sImage: posts[index].imagen,
                dFontSize: 30,
                iPosition: index,
            );
          },
          separatorBuilder: (context, index) {
            return const Divider();
          }
      );
    } else {
      return GridView.builder(
          padding: const EdgeInsets.all(20),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisExtent: 125,
          ),
          itemCount: posts.length,
          itemBuilder: (context, index) {
            return PostGridView(
                sTitle: posts[index].titulo,
                sBody: posts[index].cuerpo,
                dFontSize: 30,
                iPosition: index,
            );
          }
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: DataHolder().colorFondo,
        appBar: AppBar(
          title: TextoCustom(sText: 'HOME', dSize: 36, cTextColor: DataHolder().colorTerciario),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        body: Center(
            child: gridOrList(bIsList)
        )
    );
  }
}