import 'package:flutter/material.dart';

const razerColor = Color.fromARGB(255, 5, 228, 61);
const txtBgclr = Colors.black;
const txtclr = Color.fromARGB(255, 5, 228, 61);
var style1 = ElevatedButton.styleFrom(
  foregroundColor: txtBgclr, backgroundColor: razerColor,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
  minimumSize: const Size(130, 50),
);
var style2 = ElevatedButton.styleFrom(
    foregroundColor: txtBgclr, backgroundColor: razerColor,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
    minimumSize: const Size(200, 50));

const gradColor = BoxDecoration(
    gradient: LinearGradient(
  begin: Alignment.topRight,
  end: Alignment.bottomLeft,
  colors: [
    Colors.red,
    Colors.blue,
  ],
));
