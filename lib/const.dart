import 'package:flutter/material.dart';

TextStyle primary =
    TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Sen');

Color primaryColor = Color(0xff039BE5);

List<DropdownMenuItem<int>> languages = [
  DropdownMenuItem(
    child: Text("English"),
    value: 0,
  ),
  DropdownMenuItem(
    child: Text("German"),
    value: 1,
  ),
  DropdownMenuItem(
    child: Text("Hindi"),
    value: 2,
  ),
  DropdownMenuItem(
    child: Text("Spanish"),
    value: 3,
  ),
  DropdownMenuItem(
    child: Text("Italian"),
    value: 4,
  )
];
