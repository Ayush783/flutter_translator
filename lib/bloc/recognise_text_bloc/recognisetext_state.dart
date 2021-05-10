part of 'recognisetext_bloc.dart';

abstract class RecogniseTextState {}

class RecogniseTextInitial extends RecogniseTextState {}

class RecognisingText extends RecogniseTextState {}

class RecognisedText extends RecogniseTextState {
  final String text, language, languageCode;

  RecognisedText(
    this.text,
    this.language,
    this.languageCode,
  );
}

class RecognisingTextFailure extends RecogniseTextState {}
