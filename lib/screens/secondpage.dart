// ignore_for_file:  prefer_const_constructors_in_immutables, avoid_print, depend_on_referenced_packages, unused_element

// ignore: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:newapp/themecode/themecode.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:newapp/screens/spentstats.dart';
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


  Widget _entryField(
    String title,
    TextEditingController controller,
  ) {
    return TextField(
      cursorColor: razerColor,
      controller: controller,
      
      style: const TextStyle(color: razerColor, fontSize: 20),
      decoration: InputDecoration(
        border: const OutlineInputBorder(borderSide: BorderSide(color: razerColor)),
        labelText: title,
        labelStyle: const TextStyle(color: razerColor),
        enabledBorder:
            const UnderlineInputBorder(borderSide: BorderSide(color: razerColor)),
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
      dropdownColor: const Color.fromARGB(255, 48, 46, 46),
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
          color: razerColor,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.black,
        title: const Text(
          'Money Spent',
          style: TextStyle(
              color: razerColor, fontFamily: 'DidactGothic', fontSize: 30),
        ),
      ),
      body: Container(
        color: const Color.fromARGB(255, 26, 25, 25),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: <Widget>[
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
            Padding(padding: const EdgeInsets.all(8),
            child: TextField(
              //make this have padding on the left and right
              
              controller: _controllerField,
              keyboardType: TextInputType.number,
              cursorColor: txtclr,
              style: const TextStyle(color: razerColor, fontSize: 30),
              decoration: const InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide(color: razerColor)),

                  hintStyle: (TextStyle(
                      color: txtclr, fontFamily: 'DidactGotgic', fontSize: 20)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: txtclr)),
                  hintText: 'Amount'),
            ),
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
                  _controllerField.clear(); 
                },
                child: const Text('Add')),

            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                style: style1,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Fetchdata()),
                  );
                },
                child: const Text('Spent Stats')),
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
