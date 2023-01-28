
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:newapp/screens/getshitton.dart';


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
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Signed in as: ' + user.uid,
            style: TextStyle(fontSize: 20),
          ),
          Expanded(child: FutureBuilder(
            future: getDocID(),
            builder: ((context, snapshot) {
            
              return ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: GetMoney(documentId: user.uid),
                    );
                  });
            
          })))
        ],
      ),
    ));
  }
}
