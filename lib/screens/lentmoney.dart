// ignore_for_file: unused_import, prefer_const_constructors_in_immutables, avoid_print, depend_on_referenced_packages

// ignore: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:newapp/main.dart';
import 'package:newapp/screens/firstpage.dart';
import 'package:newapp/themecode/themecode.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:newapp/screens/lentstats.dart';

// ignore: must_be_immutable
class LentMoney extends StatefulWidget {
  const LentMoney({Key? key}) : super(key: key);

  @override
  Valid createState() => Valid();

  void onSubmit(String amount) {}
}

class Valid extends State<LentMoney> {
  // ignore: unused_field
  final _formKey = GlobalKey<FormState>();
  // declare a variable to keep track of the input text
  String amount = ' ';

  int lentmoney = 0;

  getLentValue() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    int? lnmoney = pref.getInt('money value');
    return lnmoney;
  }

  setLentMoney() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt('givenmoney', lentmoney);
  }

  checkLentvalue() async {
    int lenmon = await getLentValue() ?? 0;
    setState(() {
      lentmoney = lenmon;
    });
  }

  @override
  void initState() {
    super.initState();
    checkLentvalue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                setLentMoney();
              },
              child: const Text('OK')),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
              style: style1,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        LentStats(lent: lentmoney.toString())));
              },
              child: const Text('Lent Stats')),
          const SizedBox(
            height: 230,
          ),
          const Text(
            'by Nischay Morya 102103763',
            style: TextStyle(
                color: razerColor, fontFamily: 'DidactGothic', fontSize: 15),
          ),
        ]),
      ),
    );
  }
}
