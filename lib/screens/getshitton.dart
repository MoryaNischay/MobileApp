import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GetMoney extends StatelessWidget {
  final String documentId;
  const GetMoney({required this.documentId});

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
            return Text("Amount Lent: ${data['Lent']}");
          }
          return const Text("loading...");
        })));
  }
}
