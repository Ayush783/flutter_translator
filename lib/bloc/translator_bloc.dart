import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_translator/sevices/mlkit.dart';

part 'translator_event.dart';
part 'translator_state.dart';

class TranslatorBloc extends Bloc<TranslatorEvent, TranslatorState> {
  TranslatorBloc() : super(TranslatorInitial());

  MLKit mlKit = MLKit();

  @override
  Stream<TranslatorState> mapEventToState(
    TranslatorEvent event,
  ) async* {
    yield TranslatorInitial();
    if (event is RecogniseText) {
      yield TranslatorLoading();
      final textResponse = await mlKit.recogniseText(event.image);
      final languageResponse = await mlKit.identifyLanguage(textResponse.text);
      yield TranslatorRecognisedText(
        textResponse.text,
        languageResponse.language,
        languageResponse.languageCode,
      );
    }
  }
}
