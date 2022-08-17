// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:newapp/main.dart';

import 'package:newapp/screens/secondpage.dart';

import 'package:newapp/themecode/themecode.dart';
import 'package:newapp/screens/lentmoney.dart';

class ExpPage extends StatelessWidget {
  const ExpPage({super.key});

  @override
  Widget build(context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: const Color.fromARGB(0, 0, 0, 100)),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: BackButton(
            color: Colors.black,
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const HomePage()),
              // );
            },
          ),
          backgroundColor: razerColor,
          centerTitle: true,
          title: const Text(
            'Select A Service',
            style: TextStyle(
                color: Colors.black, fontFamily: 'DidactGothic', fontSize: 30),
          ),
        ),
        body: Container(
          margin: const EdgeInsets.all(20),
          child: Column(children: [
            const SizedBox(
              height: 50,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              ElevatedButton(
                style: style1,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondRoute()),
                  );
                },
                child: const Text(
                  'Money Spent',
                  style: TextStyle(fontFamily: 'DidactGothic', fontSize: 17),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LentMoney()),
                  );
                },
                style: style1,
                child: const Text(
                  'Money Lent',
                  style: TextStyle(fontFamily: 'DidactGothic', fontSize: 17),
                ),
              ),
            ]),
            
          ]),
        ),
      ),
    );
  }
}
