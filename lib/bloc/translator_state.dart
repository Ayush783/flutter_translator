part of 'translator_bloc.dart';

abstract class TranslatorState extends Equatable {
  const TranslatorState();

  @override
  List<Object> get props => [];
}

class TranslatorInitial extends TranslatorState {}

class TranslatorLoading extends TranslatorState {}

class TranslatorRecognisedText extends TranslatorState {
  final String text, language, languageCode;

  TranslatorRecognisedText(
    this.text,
    this.language,
    this.languageCode,
  );
}

class TranslatorTranslatingInProgress extends TranslatorState {}

class TranslatorTranslatedText extends TranslatorState {}
