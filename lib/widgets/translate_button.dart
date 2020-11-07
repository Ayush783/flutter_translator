import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translator/bloc/translate_bloc/translator_bloc.dart';

import '../const.dart';

class TranslateButton extends StatelessWidget {
  const TranslateButton({
    Key key,
    @required this.size,
    this.text,
    this.fromLangCode,
    this.tolangCode,
  }) : super(key: key);

  final Size size;
  final String text, fromLangCode, tolangCode;

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final bloc = BlocProvider.of<TranslatorBloc>(context);
    return GestureDetector(
      onTap: () => bloc.add(
        TranslateText(text, fromLangCode, tolangCode),
      ),
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: size.width / 12, vertical: size.height / 64),
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            'Translate',
            style: primary.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
