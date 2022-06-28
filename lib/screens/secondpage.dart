// ignore_for_file: unused_import, prefer_const_constructors_in_immutables

// ignore: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:newapp/main.dart';
import 'package:newapp/screens/firstpage.dart';
import 'package:newapp/themecode/themecode.dart';

// ignore: must_be_immutable
class SecondRoute extends StatefulWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  Valid createState() => Valid();

  void onSubmit(String amount) {}
}

class Valid extends State<SecondRoute> {
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

  int a = 0;
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
          'Money Spent',
          style: TextStyle(
              color: Colors.black, fontFamily: 'DidactGothic', fontSize: 30),
        ),
      ),
      body: Container(
        // key: _formKey,
        margin: const EdgeInsets.only(top: 30, left: 65),
        child: Column(children: [
          const Text(
            'Enter Your Spent Amount',
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
                a = a + int.parse(amount);
              },
              child: const Text('Groceries')),
          ElevatedButton(
              onPressed: () {
                print(a);
              },
              child: const Text('click here'))
        ]),
      ),
    );
  }
}
