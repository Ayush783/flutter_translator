part of 'recognisetext_bloc.dart';

abstract class RecogniseTextEvent extends Equatable {
  const RecogniseTextEvent();

  @override
  List<Object> get props => [];
}

class RecogniseText extends RecogniseTextEvent {
  final File image;

  RecogniseText(this.image);
}
