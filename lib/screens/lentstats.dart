// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:newapp/screens/getshitton.dart';
import 'package:newapp/themecode/themecode%20copy.dart';


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
          backgroundColor: razerColor,
          centerTitle: true,
          title: Text(
            'Signed in as: ${user.uid}',
            style: const TextStyle(
              color: Colors.black, fontFamily: 'DidactGothic', fontSize: 30,
            ),
          ),
        ),
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //add sized box here
          const SizedBox(
            height: 20,
          ),
          Text(
            'Signed in as: ${user.uid}',
            style: const TextStyle(fontSize: 20),
          ),
          Expanded(child: Scaffold( 
            body:
          FutureBuilder(
            future: getDocID(),
            builder: ((context, snapshot) {
            
              return ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: GetMoney(documentId: user.uid),
                    );
                  });
            
          }))))
        ],
      ),
    ));
  }
}
