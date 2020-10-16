import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:translator/bloc/bloc_bloc.dart';
import 'package:translator/widgets/text_area_widget.dart';

import '../appbar.dart';
import '../const.dart';

class TranslateScreen extends StatefulWidget {
  final File image;

  const TranslateScreen({Key key, this.image}) : super(key: key);

  @override
  _TranslateScreenState createState() => _TranslateScreenState();
}

class _TranslateScreenState extends State<TranslateScreen> {
  int _value = 1;
  String _recognisedText;
  // ignore: close_sinks
  final bloc = BlocBloc();
  @override
  void initState() {
    super.initState();
    bloc.add(RecogniseText(widget.image));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appbar,
      body: BlocBuilder<BlocBloc, BlocState>(
        cubit: bloc,
        builder: (context, state) {
          if (state is BlocLoading)
            return Center(child: CircularProgressIndicator());
          else if (state is BlocRecognisedText) {
            _recognisedText = state.text;
            return buildBody(size);
          } else
            return Center(
              child: Text('Retry'),
            );
        },
      ),
    );
  }

  Padding buildBody(Size size) {
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
                        text: 'Language: Latin',
                        style:
                            primary.copyWith(fontSize: 12, color: Colors.black))
                  ]),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: size.height / 32),
          ),
          TextAreaWidget(
            size: size,
            text: _recognisedText,
          ),
          Padding(
            padding: EdgeInsets.only(top: size.height / 32),
          ),
          buildSelectLanguageDropDown(size),
          Padding(
            padding: EdgeInsets.only(top: size.height / 32),
          ),
          buildTranslateButton(size),
          Padding(
            padding: EdgeInsets.only(top: size.height / 32),
          ),
        ],
      ),
    );
  }

  GestureDetector buildTranslateButton(Size size) {
    return GestureDetector(
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

  Container buildSelectLanguageDropDown(Size size) {
    return Container(
      width: size.width / 3.6,
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
