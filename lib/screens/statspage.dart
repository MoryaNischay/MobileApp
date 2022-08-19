// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:newapp/themecode/themecode.dart';

class StatsPage extends StatelessWidget {
  String groceries, Essentials, others;
  StatsPage(
      {Key? key,
      required this.groceries,
      required this.Essentials,
      required this.others})
      : super(key: key);
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
          'Money Spent',
          style: TextStyle(
              color: txtBgclr, fontFamily: 'DidactGothic', fontSize: 30),
        ),
      ),
      body: Center(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Text(
                'Amount spent on Groceries: $groceries',
                style: const TextStyle(
                    color: razerColor,
                    fontFamily: 'DidactGothic',
                    fontSize: 24),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Amount spent on Essentials: $Essentials',
                style: const TextStyle(
                    color: razerColor,
                    fontFamily: 'DidactGothic',
                    fontSize: 24),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Amount spent on Other Stuff: $others',
                style: const TextStyle(
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
