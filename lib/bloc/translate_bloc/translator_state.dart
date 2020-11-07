part of 'translator_bloc.dart';

abstract class TranslatorState extends Equatable {
  const TranslatorState();

  @override
  List<Object> get props => [];
}

class TranslatorInitial extends TranslatorState {}

class TranslatorTranslatingInProgress extends TranslatorState {}

class TranslatorTranslatedText extends TranslatorState {
  final text;

  TranslatorTranslatedText(this.text);
}