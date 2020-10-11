import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:translator/sevices/pick_image.dart';

import '../appbar.dart';
import '../const.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildCaptureButton(),
          Padding(padding: EdgeInsets.only(top: 20)),
          Text(
            'Capture Image',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 25)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'NOTE: Try to take a clear picture of the text to be translated',
              style: TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }

  //capture button
  Center buildCaptureButton() {
    Capture capture = Capture();
    return Center(
      child: GestureDetector(
        onTap: () async {
          await capture.getImage();
        },
        child: Material(
          elevation: 8,
          borderRadius: BorderRadius.circular(30),
          child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  color: primaryColor, borderRadius: BorderRadius.circular(30)),
              child: Center(
                child: SvgPicture.asset(
                  'icons/capture.svg',
                  height: 40,
                  width: 40,
                ),
              )),
        ),
      ),
    );
  }
}
