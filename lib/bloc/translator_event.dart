part of 'translator_bloc.dart';

abstract class TranslatorEvent extends Equatable {
  const TranslatorEvent();

  @override
  List<Object> get props => [];
}

class RecogniseText extends TranslatorEvent {
  final File image;

  RecogniseText(this.image);
}

class TranslateText extends TranslatorEvent {
  final String text, langCode;

  TranslateText(this.text, this.langCode);
}
