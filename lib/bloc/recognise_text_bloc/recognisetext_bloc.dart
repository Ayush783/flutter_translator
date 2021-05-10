import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter_translator/sevices/mlkit.dart';

part 'recognisetext_event.dart';
part 'recognisetext_state.dart';

class RecogniseTextBloc extends Bloc<RecogniseTextEvent, RecogniseTextState> {
  RecogniseTextBloc() : super(RecogniseTextInitial());

  MLKit mlKit = MLKit();

  @override
  Stream<RecogniseTextState> mapEventToState(
    RecogniseTextEvent event,
  ) async* {
    yield RecogniseTextInitial();
    if (event is RecogniseText) {
      yield RecognisingText();
      final textResponse = await mlKit.recogniseText(event.image);
      final languageResponse = await mlKit.identifyLanguage(textResponse.text);
      if (languageResponse.language == null && textResponse.text == null)
        yield RecognisingTextFailure();
      else
        yield RecognisedText(
          textResponse.text,
          languageResponse.language,
          languageResponse.languageCode,
        );
    }
  }
}
