import 'package:flutter/material.dart';

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

  Future<void> checkSession() async {
    await Future.delayed(const Duration(seconds: 4));
    Navigator.of(context).popAndPushNamed('/loginview');
  }

  @override
  Widget build(BuildContext context) {

    return const Scaffold(
        body: Center(
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