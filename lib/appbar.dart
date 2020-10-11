import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:translator/const.dart';

AppBar appbar = AppBar(
  automaticallyImplyLeading: false,
  title: Text(
    'Translator',
    style: primary,
  ),
  centerTitle: true,
  actions: [
    SvgPicture.asset(
      'icons/settings.svg',
      height: 22,
      width: 22,
    ),
    Padding(padding: EdgeInsets.only(right: 20))
  ],
);
