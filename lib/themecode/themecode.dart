import 'package:flutter/material.dart';

const razerColor = Color.fromARGB(255, 5, 228, 61);

var style1 = ElevatedButton.styleFrom(
  primary: razerColor,
  onPrimary: Colors.black,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
  minimumSize: const Size(130, 50),
);
var style2 = ElevatedButton.styleFrom(
    primary: razerColor,
    onPrimary: Colors.black,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
    minimumSize: const Size(200, 50));

const txtBgclr = Colors.black;
