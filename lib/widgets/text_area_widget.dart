import 'package:flutter/material.dart';

class TextAreaWidget extends StatelessWidget {
  const TextAreaWidget({
    Key key,
    this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 140,
        child: Wrap(
          children: [
            Text(text),
          ],
        ));
  }
}
