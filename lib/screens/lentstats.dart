// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:newapp/themecode/themecode.dart';

class LentStats extends StatelessWidget {
  const LentStats({Key? key}) : super(key: key);

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
        child: Center(
          child: Column(
            children: const [
              SizedBox(
                height: 30,
              ),
              Text(
                'Amount Lent to others ',
                style: TextStyle(
                    color: razerColor,
                    fontFamily: 'DidactGothic',
                    fontSize: 24),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
