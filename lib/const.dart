import 'package:flutter/material.dart';
import 'package:flutter_translator/models/supported_languages.dart';

TextStyle primary =
    TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Sen');

Color primaryColor = Color(0xff039BE5);

List<DropdownMenuItem<String>> languages = [
  for (int i = 0; i < supportedLanguages.length; i++)
    DropdownMenuItem<String>(
      child: Text(List.from(supportedLanguages.values)[i]),
      value: List.from(supportedLanguages.keys)[i],
    ),
];
