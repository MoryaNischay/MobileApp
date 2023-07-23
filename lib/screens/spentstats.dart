// ignore_for_file: avoid_print, avoid_function_literals_in_foreach_calls

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
        .collection('Groceries')
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
          leading: BackButton(
            color: razerColor,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: const Color.fromARGB(0, 0, 0, 0),
          centerTitle: true,
          title: const Text(
            'Money Spent',
            style: TextStyle(
              color: razerColor, fontFamily: 'DidactGothic', fontSize: 30,
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
            style: const TextStyle(color: razerColor,fontSize: 20),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 10)),
          Expanded(
             
            child:Container(
             
              
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 48, 46, 46),
                borderRadius: BorderRadius.circular(20),
              ),
            child: FutureBuilder(
            
            future: getDocID(),
            builder: ((context, snapshot) {
              //make a list which will contain getgroc getess getott
              List<Widget> list = [];
              if (snapshot.connectionState == ConnectionState.done) {
                
                  list.add(ListTile(
                    title: GetGroc(documentId: user.uid),
                  ));
                  list.add(ListTile(
                    title: GetEss(documentId:   user.uid),
                  ));
                  list.add(ListTile(
                    title: GetOtt(documentId:   user.uid),
                  ));
                return ListView.separated(
                  padding: const EdgeInsets.all(8),
                  itemCount: list.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(180, 0, 0, 0),
                      ),
                      height: 100,
                      
                      child: Center(child: list[index]),
                    );
                  }
                  , separatorBuilder: (BuildContext context, int index) => const Divider(),
                  );
                  
              }
              return const Text("loading...");

            
          }),
            )

          ))
        ],
      ),
      
    ));
  }
}
