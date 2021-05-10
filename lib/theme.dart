import 'package:flutter/material.dart';

import 'const.dart';

ThemeData theme = ThemeData(
  primaryColor: primaryColor,
  fontFamily: 'sen',
  scrollbarTheme: ScrollbarThemeData(
    thumbColor: MaterialStateProperty.all<Color>(primaryColor),
    showTrackOnHover: true,
    radius: Radius.circular(4),
  ),
);
