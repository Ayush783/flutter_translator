import 'dart:io';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:translator/models/text_response.dart';

class MLKit {
  final instance = FirebaseVision.instance;

  //method to recognise text
  Future<TextResponse> recogniseText(File image) async {
    FirebaseVisionImage imageObject = FirebaseVisionImage.fromFile(image);
    List<RecognizedLanguage> _languages;
    final recogniser = instance.textRecognizer();
    final VisionText visionText = await recogniser.processImage(imageObject);
    String text = visionText.text;
    recogniser.close();
    return TextResponse(text, _languages, '');
  }
}
