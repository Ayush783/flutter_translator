import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_translator/bloc/recognise_text_bloc/recognisetext_bloc.dart';
import 'package:flutter_translator/bloc/translate_bloc/translator_bloc.dart';
import 'package:flutter_translator/widgets/text_area_widget.dart';
import 'package:flutter_translator/widgets/translate_button.dart';

import '../appbar.dart';
import '../const.dart';

class TranslateScreen extends StatefulWidget {
  final File image;

  const TranslateScreen({Key key, this.image}) : super(key: key);

  @override
  _TranslateScreenState createState() => _TranslateScreenState();
}

class _TranslateScreenState extends State<TranslateScreen> {
  int _value = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MultiBlocProvider(
      providers: [
        BlocProvider<RecogniseTextBloc>(
          create: (context) => RecogniseTextBloc()
            ..add(
              RecogniseText(widget.image),
            ),
        ),
        BlocProvider(
          create: (context) => TranslatorBloc(),
        )
      ],
      child: Scaffold(
        appBar: appbar,
        body: BlocBuilder<RecogniseTextBloc, RecogniseTextState>(
          builder: (context, state) {
            if (state is RecognisingText)
              return Center(child: CircularProgressIndicator());
            else if (state is RecognisedText)
              return buildBody(size, state);
            else {
              return Center(
                child: Text('Retry'),
              );
            }
          },
        ),
      ),
    );
  }

  Padding buildBody(Size size, RecognisedText state) {
    return Padding(
      padding: EdgeInsets.only(
          left: size.width / 12, right: size.width / 12, top: size.width / 12),
      child: Column(
        children: [
          Center(
            child: Text.rich(
              TextSpan(
                  text: 'Recognised Text\n',
                  style: primary.copyWith(color: primaryColor),
                  children: [
                    TextSpan(
                        text: 'Language: ${state.language}',
                        style:
                            primary.copyWith(fontSize: 12, color: Colors.black))
                  ]),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: size.height / 32),
          ),
          //recognised text placeholder
          TextAreaWidget(
            size: size,
            text: state.text,
          ),
          Padding(
            padding: EdgeInsets.only(top: size.height / 32),
          ),
          buildSelectLanguageDropDown(size),
          Padding(
            padding: EdgeInsets.only(top: size.height / 32),
          ),
          //translate button
          TranslateButton(
            size: size,
            text: state.text,
            fromLangCode: state.languageCode,
            tolangCode: 'ru',
          ),
          Padding(
            padding: EdgeInsets.only(top: size.height / 32),
          ),
        ],
      ),
    );
  }

  Container buildSelectLanguageDropDown(Size size) {
    return Container(
      width: size.width / 2.5,
      child: DropdownButton(
          dropdownColor: Colors.white,
          style: primary.copyWith(color: primaryColor),
          underline: Container(color: primaryColor, height: 2),
          icon: SvgPicture.asset(
            'icons/drop_down.svg',
            height: size.width / 12,
            width: size.width / 12,
          ),
          iconSize: size.width / 12,
          isExpanded: true,
          value: _value,
          items: languages,
          onChanged: (value) {
            setState(() {
              _value = value;
            });
          }),
    );
  }
}
