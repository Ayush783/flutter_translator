part of 'translator_bloc.dart';

abstract class TranslatorEvent extends Equatable {
  const TranslatorEvent();

  @override
  List<Object> get props => [];
}

class TranslateText extends TranslatorEvent {
  final String text, fromLangCode, tolangCode;

  TranslateText(this.text, this.fromLangCode, this.tolangCode);
}
