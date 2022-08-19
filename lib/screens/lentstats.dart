// ignore_for_file: must_be_immutable, non_constant_identifier_names




import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newapp/themecode/themecode.dart';

class LentStats extends StatefulWidget {
  const LentStats({Key? key}) : super(key: key);

  @override
  State<LentStats> createState() => _LentStatsState();
}

class _LentStatsState extends State<LentStats> {
  FirebaseAuth auth = FirebaseAuth.instance;

  // Future GetMoney() async {
  //   String uid = auth.currentUser!.uid.toString();
  //   var data =
  //       FirebaseFirestore.instance.collection('MoneyLent').doc(uid).get();
  //   print(data);
  // }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: txtBgclr,
      appBar: AppBar(
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
              color: Colors.black, fontFamily: 'DidactGothic', fontSize: 30),
        ),
      ),
      body: Center(
        child: Column(
          children: const [
            SizedBox(
              height: 30,
            ),
            Text(
              'Amount Lent to others ',
              style: TextStyle(
                  color: razerColor, fontFamily: 'DidactGothic', fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
