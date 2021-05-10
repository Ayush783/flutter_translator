part of 'translator_bloc.dart';

abstract class TranslatorState {}

class TranslatorInitial extends TranslatorState {}

class TranslatorTranslatingInProgress extends TranslatorState {}

class TranslatorTranslatedText extends TranslatorState {
  final text;

  TranslatorTranslatedText(this.text);
}

class TranslatorFailure extends TranslatorState {}
