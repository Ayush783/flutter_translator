import 'dart:io';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter_language_identification/flutter_language_identification.dart';
import 'package:flutter_translator/models/language_response.dart';
import 'package:flutter_translator/models/text_response.dart';
import 'package:flutter_translator/models/supported_languages.dart';
import 'package:flutter_translator/models/translation_response.dart';
import 'package:translator/translator.dart';

class MLKit {
  //method to recognise text
  Future<TextResponse> recogniseText(File image) async {
    final instance = FirebaseVision.instance;
    FirebaseVisionImage imageObject = FirebaseVisionImage.fromFile(image);
    final recogniser = instance.textRecognizer();
    final VisionText visionText = await recogniser.processImage(imageObject);
    final String text = visionText.text;
    recogniser.close();
    return TextResponse(text, '');
  }

  Future<LanguageResponse> identifyLanguage(String text) async {
    String _lang;
    FlutterLanguageIdentification languageIdentification =
        FlutterLanguageIdentification();
    await languageIdentification.identifyLanguage(text);
    languageIdentification.setSuccessHandler((code) {
      _lang = code;
    });
    await Future.delayed(
      Duration(milliseconds: 100),
    );
    return LanguageResponse(_lang, supportedLanguages[_lang.toString()], '');
  }

  Future<TranslatedText> translateText(
      String text, String fromLangCode, String toLangCode) async {
    final translator = GoogleTranslator();
    final Translation translatedText =
        await translator.translate(text, from: fromLangCode, to: toLangCode);
    return TranslatedText(translatedText.text, '');
  }
}
