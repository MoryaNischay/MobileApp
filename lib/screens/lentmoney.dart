// ignore_for_file: unused_import, prefer_const_constructors_in_immutables, avoid_print

// ignore: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:newapp/main.dart';
import 'package:newapp/screens/firstpage.dart';
import 'package:newapp/themecode/themecode.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class LentMoney extends StatefulWidget {
  const LentMoney({Key? key}) : super(key: key);

  @override
  Valid createState() => Valid();

  void onSubmit(String amount) {}
}

class Valid extends State<LentMoney> {
  final _formKey = GlobalKey<FormState>();
  // declare a variable to keep track of the input text
  String amount = ' ';
  void _submit() {
    // validate all the form fields
    if (_formKey.currentState!.validate()) {
      // on success, notify the parent widget
      widget.onSubmit(amount);
    }
  }

  int lentmoney = 0;

  getValue() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    int? money = pref.getInt('money value');
    return money;
  }

  setMoney() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt('money value', lentmoney);
  }

  checkGrocvalue() async {
    int groc = await getValue() ?? 0;
    setState(() {
      lentmoney = groc;
    });
  }

  @override
  void initState() {
    super.initState();
    checkGrocvalue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
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
      body: Container(
        // key: _formKey,
        margin: const EdgeInsets.only(top: 30, left: 65),
        child: Column(children: [
          const Text(
            'Enter Amount Lent',
            style: TextStyle(
                color: razerColor, fontFamily: 'DidactGothic', fontSize: 26),
          ),
          const SizedBox(
            height: 80,
          ),
          ConstrainedBox(
            constraints: const BoxConstraints.tightFor(width: 200, height: 100),
            child: TextFormField(
                onChanged: (val) => setState(() {
                      amount = val;

                      //
                    }),
                keyboardType: TextInputType.number,
                cursorColor: razerColor,
                style: const TextStyle(color: razerColor, fontSize: 30),
                decoration: const InputDecoration(
                  hintStyle: (TextStyle(
                      color: razerColor,
                      fontFamily: 'DidactGothic',
                      fontSize: 20)),
                  border: UnderlineInputBorder(),
                  hintText: 'Amount',
                )),
          ),
          ElevatedButton(
              style: style1,
              onPressed: () {
                lentmoney = lentmoney + int.parse(amount);
                print(lentmoney);
                setMoney();
              },
              child: const Text('OK')),
        ]),
      ),
    );
  }
}
