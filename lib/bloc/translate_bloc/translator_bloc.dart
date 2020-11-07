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
    if (event is TranslateText) {
      yield TranslatorTranslatingInProgress();
      final translateResponse = await mlKit.translateText(
          event.text, event.fromLangCode, event.tolangCode);
      print('\n\n\n1');
      yield TranslatorTranslatedText(translateResponse.text);
    }
  }
}
