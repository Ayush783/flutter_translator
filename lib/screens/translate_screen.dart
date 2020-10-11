import 'dart:io';

import 'package:flutter/material.dart';

import '../appbar.dart';
import '../const.dart';

class TranslateScreen extends StatelessWidget {
  final File image;

  const TranslateScreen({Key key, this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 30),
        child: Column(
          children: [
            buildImagePlaceHolder(),
          ],
        ),
      ),
    );
  }

  //a place holder for the captured image
  Center buildImagePlaceHolder() {
    return Center(
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 200,
          width: 240,
          decoration: BoxDecoration(
            border: Border.all(color: primaryColor),
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(image: FileImage(image), fit: BoxFit.fill),
          ),
        ),
      ),
    );
  }
}
