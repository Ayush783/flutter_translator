import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:translator/sevices/mlkit.dart';

part 'bloc_event.dart';
part 'bloc_state.dart';

class BlocBloc extends Bloc<BlocEvent, BlocState> {
  BlocBloc() : super(BlocInitial());

  MLKit mlKit = MLKit();

  @override
  Stream<BlocState> mapEventToState(
    BlocEvent event,
  ) async* {
    yield BlocInitial();
    if (event is RecogniseText) {
      yield BlocLoading();
      final textResponse = await mlKit.recogniseText(event.image);
      final languageResponse = await mlKit.identifyLanguage(textResponse.text);
      yield BlocRecognisedText(
        textResponse.text,
        languageResponse.language,
        languageResponse.languageCode,
      );
    }
  }
}
