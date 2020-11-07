import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translator/bloc/translate_bloc/translator_bloc.dart';
import 'package:flutter_translator/widgets/text_area_widget.dart';

class TranslatedTextPlaceHolderWidget extends StatelessWidget {
  const TranslatedTextPlaceHolderWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<TranslatorBloc, TranslatorState>(
      builder: (context, state) {
        if (state is TranslatorInitial) {
          return Container();
        } else if (state is TranslatorTranslatingInProgress) {
          return Center(child: CircularProgressIndicator());
        } else if (state is TranslatorTranslatedText) {
          return TextAreaWidget(
            size: size,
            text: state.text,
          );
        } else {
          return Center(
            child: Text('Error'),
          );
        }
      },
    );
  }
}
