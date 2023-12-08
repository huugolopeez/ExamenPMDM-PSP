import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:examen_pmdm/customViews/TextoCustom.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../customViews/DrawerClass.dart';
import '../customViews/PostCellView.dart';
import '../customViews/PostGridView.dart';
import '../firestoreObjects/FbPost.dart';
import '../onBoarding/LoginView.dart';
import '../singletone/DataHolder.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  final List<FbPost> posts = [];
  bool bIsList = true;

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

  void onItemTapList(int index) {
    DataHolder().selectedPost = posts[index];
    DataHolder().saveSelectedPostInCache();
    Navigator.of(context).pushNamed('/postview');
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
                onItemTap: onItemTapList
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
                onItemTap: onItemTapList
            );
          }
      );
    }
  }

  void onItemTapDrawer(int index) {
    setState(() {
      if(index == 0) {
        FirebaseAuth.instance.signOut();
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => LoginView()),
            ModalRoute.withName('/loginview')
        );
      } else if(index == 1) {
        Navigator.of(context).pushNamed('/ajustesview');
      }
    });
  }

  void onBottomMenuPressed(int index) {
    setState(() {
      if(index == 0) {
        bIsList = true;
      } else if(index == 1) {
        bIsList = false;
      }
    });
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
        ),
        drawer: DrawerClass(onItemTap: onItemTapDrawer),
        bottomNavigationBar: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(onPressed: () => onBottomMenuPressed(0), child: Icon(Icons.list, color: DataHolder().colorPrincipal)),
              TextButton(onPressed: () => onBottomMenuPressed(1), child: Icon(Icons.grid_view, color: DataHolder().colorPrincipal))
            ]
        )
    );
  }
}