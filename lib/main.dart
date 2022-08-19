// ignore_for_file: constant_identifier_names, avoid_web_libraries_in_flutter
// add another font cause the tittle looks weird

import 'package:flutter/material.dart';
import 'package:newapp/themecode/themecode.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:newapp/screens/App.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: txtBgclr,
      ),
      home: const SnapShotDecider(),
    );
  }
}
