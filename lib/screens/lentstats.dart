// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:newapp/screens/getshitton.dart';
import 'package:newapp/themecode/themecode.dart';

class Fetchdata extends StatefulWidget {
  const Fetchdata({Key? key}) : super(key: key);

  @override
  State<Fetchdata> createState() => _FetchdataState();
}

class _FetchdataState extends State<Fetchdata> {
  final user = FirebaseAuth.instance.currentUser!;

  //docid
  List<String> docIDs = [];

  //get doc id
  Future getDocID() async {
    await FirebaseFirestore.instance
        .collection('MoneyLent')
        .get()
        // ignore: avoid_function_literals_in_foreach_calls
        .then((snapshot) => snapshot.docs.forEach((document) {
              print(document.reference);
              docIDs.add(document.reference.id);
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: txtBgclr,
        appBar: AppBar(
          leading: BackButton(
            color: razerColor,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: const Color.fromARGB(0, 0, 0, 0),
          centerTitle: true,
          title: const Text(
            'Money Lent',
            style: TextStyle(
              color: razerColor,
              fontFamily: 'DidactGothic',
              fontSize: 30,
            ),
          ),
        ),
        body: Container(
          color: const Color.fromARGB(255, 26, 25, 25),
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //add sized box here
              const SizedBox(
                height: 20,
              ),
              Text(
                'Signed in as: ${user.uid}',
                style: const TextStyle(color: razerColor, fontSize: 20),
              ),
              const Padding(padding: EdgeInsets.only(top: 50, bottom: 10)),
              Expanded(
                  child: Container(
                      padding: const EdgeInsets.only(top: 150),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(180, 0, 0, 0),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: FutureBuilder(
                        future: getDocID(),
                        builder: ((context, snapshot) {
                          return ListView.builder(
                              itemCount: 1,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: GetMoney(documentId: user.uid),
                                );
                              });
                        }),
                      )))
            ],
          ),
        ));
  }
}
