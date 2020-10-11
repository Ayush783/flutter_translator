import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: Padding(
        padding: EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 20),
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
                          style: primary.copyWith(
                              fontSize: 12, color: Colors.black))
                    ]),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
            ),
            TextAreaWidget(
                text:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam metus lorem, egestas id orci sit amet, ullamcorper porta arcu. Donec non lectus pretium, laoreet arcu in, cursus felis. Suspendisse a rhoncus ex. In ac lectus nec elit fermentum elementum et vitae sem. Morbi eu metus leo.'),
            Padding(
              padding: EdgeInsets.only(top: 20),
            ),
            buildSelectLanguageDropDown(),
            Padding(
              padding: EdgeInsets.only(top: 20),
            ),
            buildTranslateButton(),
            Padding(
              padding: EdgeInsets.only(top: 20),
            ),
            TextAreaWidget(
                text:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. It also fears lorem want to clinical carrots, notebook gate alcohol. Until he graduated price, Laoreet throws in the cycle button. For users of the CNN of the. In the warm-up element, and this life, and the lectus nec elit sem. An alarm clock soccer lion.")
          ],
        ),
      ),
    );
  }

  GestureDetector buildTranslateButton() {
    return GestureDetector(
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
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

  Container buildSelectLanguageDropDown() {
    return Container(
      width: 100,
      child: DropdownButton(
          dropdownColor: Colors.white,
          style: primary.copyWith(color: primaryColor),
          underline: Container(color: primaryColor, height: 2),
          icon: SvgPicture.asset(
            'icons/drop_down.svg',
            height: 32,
            width: 32,
          ),
          iconSize: 32,
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
