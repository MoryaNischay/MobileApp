// ignore_for_file: unused_import, library_private_types_in_public_api, prefer_const_constructors, file_names, use_key_in_widget_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:newapp/screens/home.dart';
import 'package:newapp/themecode/themecode.dart';
import 'auth.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? errorMessage = ' ';
  bool isLogin = true;

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
        email_: _controllerEmail.text,
        password_: _controllerPassword.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
        email_: _controllerEmail.text,
        password_: _controllerPassword.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Widget _title() {
    return const Text('Firebase Auth');
  }

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
        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: razerColor)),
        //enabledBorder: OutlineInputBorder(),
      ),
    );
  }

  Widget _errorMessage() {
    return Text(errorMessage == '' ? '' : '$errorMessage',
        style: TextStyle(fontFamily: 'DidactGothic', color: razerColor));
  }

  Widget _submitButton() {
    return ElevatedButton(
      style: style2,
      onPressed:
          isLogin ? signInWithEmailAndPassword : createUserWithEmailAndPassword,
      child: Text(
        isLogin ? 'Login' : 'Register',
        style: TextStyle(fontFamily: 'DidactGothic', fontSize: 20),
      ),
    );
  }

  Widget _loginOrregisterButton() {
    return TextButton(
      onPressed: () {
        setState(() {
          isLogin = !isLogin;
        });
      },
      child: Text(
        isLogin ? 'Register Instead' : 'Login Instead',
        style: TextStyle(
            color: razerColor, fontFamily: 'DidactGothic', fontSize: 16),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: txtBgclr,
        appBar: AppBar(
          backgroundColor: razerColor,
          centerTitle: true,
          title: Text(
            isLogin ? 'Login' : 'Register',
            style: TextStyle(
                color: Colors.black, fontFamily: 'DidactGothic', fontSize: 30),
          ),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _entryField('Email', _controllerEmail),
              _entryField('Password', _controllerPassword),
              _errorMessage(),
              _submitButton(),
              _loginOrregisterButton(),
            ],
          ),
        ));
  }
}
