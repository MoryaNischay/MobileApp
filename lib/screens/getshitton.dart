import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:newapp/themecode/themecode.dart';

class GetMoney extends StatelessWidget {
  final String documentId;
  const GetMoney({super.key, required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('MoneyLent');

    return FutureBuilder<DocumentSnapshot>(
        future: users.doc(documentId).get(),
        builder: (((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Text("Amount Lent: ${data['Lent']}",
                style: const TextStyle(color:  razerColor,fontSize: 20));
          }
          return const Text("loading...");
        })));
  }
}

class GetGroc extends StatelessWidget {
  final String documentId;
  const GetGroc({super.key, required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('Groceries');

    return FutureBuilder<DocumentSnapshot>(
        future: users.doc(documentId).get(),
        builder: (((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Text("Amount Spent on Groceries: ${data['Groceries']}",
                style: const TextStyle(color:  razerColor,fontSize: 20));
          }
          return const Text("loading...");
        })));
  }
}

class GetEss extends StatelessWidget {
  final String documentId;
  const GetEss({super.key, required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('Groceries');

    return FutureBuilder<DocumentSnapshot>(
        future: users.doc(documentId).get(),
        builder: (((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Text("Amount Lent: ${data['Essentials']}",
                style:const TextStyle(color:  razerColor,fontSize: 20));
          }
          return const Text("loading...");
        })));
  }
}

class GetOtt extends StatelessWidget {
  final String documentId;
  const GetOtt({super.key, required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('Groceries');

    return FutureBuilder<DocumentSnapshot>(
        future: users.doc(documentId).get(),
        builder: (((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Text("Amount Spent on Other: ${data['Others']}",
                style: const TextStyle(color:  razerColor,fontSize: 20));
          }
          return const Text("loading...");
        })));
  }
}