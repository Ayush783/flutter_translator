part of 'recognisetext_bloc.dart';

abstract class RecogniseTextEvent {}

class RecogniseText extends RecogniseTextEvent {
  final File image;

  RecogniseText(this.image);
}
