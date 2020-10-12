import 'package:flutter/material.dart';

class TextAreaWidget extends StatelessWidget {
  const TextAreaWidget({
    Key key,
    this.text,
    this.size,
  }) : super(key: key);

  final String text;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: size.width / 2.6,
        child: Wrap(
          children: [
            Text(text),
          ],
        ));
  }
}
