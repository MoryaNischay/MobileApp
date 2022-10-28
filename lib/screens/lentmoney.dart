// ignore_for_file:  prefer_const_constructors_in_immutables, avoid_print, depend_on_referenced_packages, prefer_const_constructors, non_constant_identifier_names

// ignore: avoid_web_libraries_in_flutter

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newapp/themecode/themecode.dart';
import 'package:newapp/screens/lentstats.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LentMoney extends StatelessWidget {
  final TextEditingController _controllermon = TextEditingController();

  LentMoney({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: txtBgclr,
      appBar: AppBar(
        centerTitle: true,
        leading: BackButton(
          color: txtBgclr,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: razerColor,
        title: const Text(
          'Money Lent',
          style: TextStyle(
              color: txtBgclr, fontFamily: 'DidactGothic', fontSize: 30),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Enter Amount Lent',
              style: TextStyle(
                  color: txtclr, fontFamily: 'DidactGothic', fontSize: 26),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _controllermon,
              keyboardType: TextInputType.number,
              cursorColor: txtclr,
              style: const TextStyle(color: razerColor, fontSize: 30),
              decoration: const InputDecoration(
                  hintStyle: (TextStyle(
                      color: txtclr, fontFamily: 'DidactGotgic', fontSize: 20)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: txtclr)),
                  hintText: 'Amount'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                style: style1,
                onPressed: () async {
                  final m = _controllermon.text;

                  userSetup(Money: m);
                  _controllermon.clear();
                },
                child: Text('Submit Data')),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                style: style1,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LentStats()),
                  );
                },
                child: const Text('Lent Stats')),
          ],
        ),
      ),
    );
  }

  Future userSetup({required String Money}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    String uid = auth.currentUser!.uid.toString();
    int mnd = int.parse(Money);
    final docUser = FirebaseFirestore.instance.collection('MoneyLent').doc(uid);
    final json = {'Amount': FieldValue.increment(mnd),'userid':uid};
    await docUser.set(json, SetOptions(merge: true));
  }
}
