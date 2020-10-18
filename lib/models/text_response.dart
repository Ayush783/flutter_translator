import 'package:firebase_ml_vision/firebase_ml_vision.dart';

class TextResponse {
  final String text, error;
  final List<RecognizedLanguage> languages;

  TextResponse(this.text, this.languages, this.error);

  TextResponse.fromError(String error)
      : text = '',
        languages = [],
        error = error;
}
