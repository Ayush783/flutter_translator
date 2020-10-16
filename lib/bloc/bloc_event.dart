part of 'bloc_bloc.dart';

abstract class BlocEvent extends Equatable {
  const BlocEvent();

  @override
  List<Object> get props => [];
}

class RecogniseText extends BlocEvent {
  final File image;

  RecogniseText(this.image);
}
