part of 'bloc_bloc.dart';

abstract class BlocState extends Equatable {
  const BlocState();

  @override
  List<Object> get props => [];
}

class BlocInitial extends BlocState {}

class BlocLoading extends BlocState {}

class BlocRecognisedText extends BlocState {
  final String text, language, languageCode;

  BlocRecognisedText(
    this.text,
    this.language,
    this.languageCode,
  );
}
