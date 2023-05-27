// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'loginScreen.dart';

import 'auth.dart';
import 'firstpage.dart';

class SnapShotDecider extends StatefulWidget {
  const SnapShotDecider({Key? key}) : super(key: key);

  @override
  State<SnapShotDecider> createState() => _SnapShotDeciderState();
}

class _SnapShotDeciderState extends State<SnapShotDecider> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const ExpPage();
        } else {
          return LoginScreen();
        }
      },
    );
  }
}
