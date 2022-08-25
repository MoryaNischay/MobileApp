// ignore_for_file: prefer_const_constructors,

import 'package:flutter/material.dart';
import 'package:newapp/screens/lentstats.dart';
import 'auth.dart';
import 'package:newapp/screens/secondpage.dart';

import 'package:newapp/themecode/themecode.dart';
import 'package:newapp/screens/lentmoney.dart';

class ExpPage extends StatelessWidget {
  const ExpPage({super.key});
  Future<void> signOut() async {
    await Auth().signOut();
  }

  @override
  Widget build(context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: const Color.fromARGB(0, 0, 0, 100)),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: txtBgclr,
        appBar: AppBar(
          leading: BackButton(
            color: txtBgclr,
            onPressed: signOut,
          ),
          actions: <Widget>[funny()],
          backgroundColor: razerColor,
          centerTitle: true,
          title: const Text(
            'Welcome!',
            style: TextStyle(
                color: txtBgclr, fontFamily: 'DidactGothic', fontSize: 30),
          ),
        ),
        body: Column(children: [
          const SizedBox(
            height: 50,
          ),
          const Text(
            'Please select a service:',
            style: TextStyle(
                color: txtclr, fontFamily: 'DidactGothic', fontSize: 22),
          ),
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
    );
  }

  Widget funny() {
    return PopupMenuButton(
      itemBuilder: (context) => [
        PopupMenuItem(
          onTap: signOut,
          value: 1,
          child: Row(
            children: const [
              Icon(
                Icons.logout,
                color: txtBgclr,
              ),
              SizedBox(
                width: 5,
              ),
              Text("Sign Out")
            ],
          ),
        ),
        PopupMenuItem(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LentMoney()),
            );
          },
          value: 2,
          child: Row(
            children: const [
              Icon(
                Icons.color_lens_sharp,
                color: txtBgclr,
              ),
              SizedBox(
                width: 5,
              ),
              Text("Change Theme")
            ],
          ),
        ),
      ],
      color: Colors.grey,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Icon(
          Icons.more_vert_rounded,
          color: txtBgclr,
        ),
      ),
    );
  }
}
