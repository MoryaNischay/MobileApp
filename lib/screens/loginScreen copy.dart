// ignore_for_file: unused_import, library_private_types_in_public_api, prefer_const_constructors, file_names, use_key_in_widget_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:newapp/screens/firsthome.dart';
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

  Widget _entryField(
    String title,
    TextEditingController controller,
  ) {
    return TextField(
      //set padding in left and right to be 10
      
      cursorColor: Colors.black,
      controller: controller,
      
      style: const TextStyle(color: Colors.black, fontSize: 20),
      decoration: InputDecoration(
        contentPadding: EdgeInsetsDirectional.fromSTEB(16, 24, 0, 24),
        labelText: title,
        labelStyle: TextStyle(color: Colors.black),
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
        //enabledBorder: OutlineInputBorder(),
      ),
    );
  }

  Widget _errorMessage() {
    return Text(errorMessage == '' ? '' : '$errorMessage',
        style: TextStyle(fontFamily: 'DidactGothic', color: Colors.black));
  }

  Widget _submitButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
    foregroundColor: txtBgclr, backgroundColor: Color.fromARGB(255, 211, 165, 219),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
    minimumSize: const Size(200, 50)),
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
            color: Colors.black, fontFamily: 'DidactGothic', fontSize: 16),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.blue, Colors.purple])),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            // appBar: AppBar(
            //   backgroundColor: razerColor,
            //   centerTitle: true,
            //   title: Text(
            //     isLogin ? 'Login' : 'Register',
            //     style: TextStyle(
            //         color: Colors.black, fontFamily: 'DidactGothic', fontSize: 30),
            //   ),
            // ),

            body: Container(
              //set the padding on top to be 200
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 150),
                  ),
                  Container(

                      //round the corners of the container
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: <Widget>[
                          //set internal padding to be 20

                
                          Padding(
                            padding: const EdgeInsets.all(20)
                          ),
                          Text(
                            'Hello',
                            style: TextStyle(
                                fontFamily: 'DidactGothic',
                                fontSize: 40,
                                color: Colors.black),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                          ),
                          _entryField('Email', _controllerEmail),
                          _entryField('Password', _controllerPassword),

                          _errorMessage(),
                          _submitButton(),
                          _loginOrregisterButton(),
                        ],
                      )),
                ],
              ),
            )));
  }
}
