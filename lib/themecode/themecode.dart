import 'package:flutter/material.dart';

const razerColor = Color.fromARGB(255, 5, 228, 61);
const txtBgclr = Colors.black;
const txtclr = Color.fromARGB(255, 5, 228, 61);
const bgcolor = Color.fromARGB(255, 26, 25, 25);
var style1 = ElevatedButton.styleFrom(
  
  foregroundColor: txtBgclr, backgroundColor: const Color.fromARGB(255, 5, 228, 61),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
  minimumSize: const Size(130, 50),
);
var style2 = ElevatedButton.styleFrom(
    foregroundColor: txtBgclr, backgroundColor: const Color.fromARGB(255, 5, 228, 61),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
    minimumSize: const Size(200, 50));

