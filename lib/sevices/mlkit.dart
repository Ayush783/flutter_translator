import 'dart:io';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';

class MLKit {
  final instance = FirebaseVision.instance;
  Future<String> recogniseText(File image) async {
    FirebaseVisionImage imageObject = FirebaseVisionImage.fromFile(image);
    final recogniser = instance.textRecognizer();
    final VisionText text = await recogniser.processImage(imageObject);
    return text.text;
  }
}
