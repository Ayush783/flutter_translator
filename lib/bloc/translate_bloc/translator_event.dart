part of 'translator_bloc.dart';

abstract class TranslatorEvent {}

class TranslateText extends TranslatorEvent {
  final String text, fromLangCode, tolangCode;

  TranslateText(this.text, this.fromLangCode, this.tolangCode);
}
