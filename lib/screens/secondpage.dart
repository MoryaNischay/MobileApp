// ignore_for_file:  prefer_const_constructors_in_immutables, avoid_print, depend_on_referenced_packages

// ignore: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:newapp/themecode/themecode.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: must_be_immutable
class SecondRoute extends StatefulWidget {
  SecondRoute({Key? key}) : super(key: key);

  @override
  Valid createState() => Valid();

  void onSubmit(String amount) {}
}

class Valid extends State<SecondRoute> {
  // declare a variable to keep track of the input text
  String amount = ' ';
  final TextEditingController _controllerField = TextEditingController();
  int _groceries = 0;
  int _essentials = 0;
  int _others = 0;

  Widget _entryField(
    String title,
    TextEditingController controller,
  ) {
    return TextField(
      cursorColor: razerColor,
      controller: controller,
      style: const TextStyle(color: razerColor, fontSize: 20),
      decoration: InputDecoration(
        labelText: title,
        labelStyle: TextStyle(color: razerColor),
        enabledBorder:
            UnderlineInputBorder(borderSide: const BorderSide(color: razerColor)),
        //enabledBorder: OutlineInputBorder(),
      ),
    );
  }

  //drop down menu widget
  String dropdownValue = 'Groceries';
  Widget _dropDown() {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: razerColor, fontSize: 20),
      dropdownColor: Colors.black,
      underline: Container(
        height: 2,
        color: razerColor,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>['Groceries', 'Essentials', 'Others']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: txtBgclr,
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
              color: txtBgclr, fontFamily: 'DidactGothic', fontSize: 30),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Enter Your Spent Amount',
              style: TextStyle(
                  color: txtclr, fontFamily: 'DidactGothic', fontSize: 26),
            ),
            const SizedBox(
              height: 80,
            ),
            TextField(
              controller: _controllerField,
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
            const SizedBox(
              height: 20,
            ),
            _dropDown(),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: style1,
                onPressed: () {
                  final groc = _controllerField.text;
                  //check what is the value of the dropdown
                  if (dropdownValue == 'Groceries') {
                    userSetup(money: groc, category: 'Groceries');
                  } else if (dropdownValue == 'Essentials') {
                    userSetup(money: groc, category: 'Essentials');
                  } else {
                    userSetup(money: groc, category: 'Others');
                  } 
                },
                child: const Text('Add')),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }

  Future userSetup({required String money,required String category}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    String uid = auth.currentUser!.uid.toString();
    int mnd = int.parse(money);
    final docUser = FirebaseFirestore.instance.collection('Groceries').doc(uid);
    if (category == 'Groceries') {
      final json = {'Groceries': FieldValue.increment(mnd),'uid' : uid};
      await docUser.set(json, SetOptions(merge: true));
    } else if (category == 'Essentials') {
      final json = {'Essentials': FieldValue.increment(mnd),'uid' : uid};
      await docUser.set(json, SetOptions(merge: true));
    } else {
      final json = {'Others': FieldValue.increment(mnd),'uid' : uid};
      await docUser.set(json, SetOptions(merge: true));
    }
  }
}
