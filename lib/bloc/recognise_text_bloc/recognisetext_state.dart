part of 'recognisetext_bloc.dart';

abstract class RecogniseTextState extends Equatable {
  const RecogniseTextState();

  @override
  List<Object> get props => [];
}

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
