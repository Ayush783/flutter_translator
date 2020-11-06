import 'package:flutter/material.dart';
import 'package:translator/supported_languages.dart';

TextStyle primary =
    TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Sen');

Color primaryColor = Color(0xff039BE5);

List<DropdownMenuItem<int>> languages = [
  for (var i = 0; i < supportedLanguages.length; i++)
    DropdownMenuItem(
      child: Text(List.from(supportedLanguages.values)[i]),
      value: i,
    ),
];
