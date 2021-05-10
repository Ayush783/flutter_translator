import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_translator/models/image.dart';
import 'package:flutter_translator/screens/translate_screen.dart';
import 'package:flutter_translator/sevices/pick_image.dart';

import '../appbar.dart';
import '../const.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appbar,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildCaptureButton(context, size),
          Padding(
            padding: EdgeInsets.only(top: size.height / 32),
          ),
          Text(
            'Capture Image',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),
          ),
          Padding(padding: EdgeInsets.only(top: size.height / 27)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width / 18),
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
  Center buildCaptureButton(BuildContext context, Size size) {
    Capture capture = Capture();
    return Center(
      child: GestureDetector(
        onTap: () async {
          final CapturedImage image = await capture.getImage();
          if (image.error == '') {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TranslateScreen(image: image.image),
                ));
          }
        },
        child: Material(
          elevation: 8,
          type: MaterialType.circle,
          color: Colors.transparent,
          child: Container(
              height: size.height / 11,
              width: size.width / 6,
              decoration: BoxDecoration(
                color: primaryColor,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: SvgPicture.asset(
                  'icons/capture.svg',
                  height: size.width / 9,
                  width: size.width / 9,
                ),
              )),
        ),
      ),
    );
  }
}
