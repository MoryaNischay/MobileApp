// ignore_for_file: constant_identifier_names, avoid_web_libraries_in_flutter
// add another font cause the tittle looks weird

import 'package:flutter/material.dart';

import 'package:newapp/screens/secondpage.dart';
import 'package:newapp/screens/firstpage.dart';
import 'package:newapp/themecode/themecode.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MaterialApp(
    title: 'Navigation Basics',
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: txtBgclr),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: txtBgclr,
        appBar: AppBar(
          backgroundColor: razerColor,
          centerTitle: true,
          title: const Text(
            'Select A Client',
            style: TextStyle(
                color: txtBgclr, fontFamily: 'DidactGothic', fontSize: 30),
          ),
        ),
        body: Container(
          margin: const EdgeInsets.only(top: 113, left: 98),
          child: Column(children: [
            ElevatedButton(
              style: style2,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyApp()),
                );
              },
              child: const Text(
                'Individual',
                style: TextStyle(fontFamily: 'DidactGothic', fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {},
              style: style2,
              child: const Text(
                '//Under Development',
                style: TextStyle(fontFamily: 'DidactGothic', fontSize: 20),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
