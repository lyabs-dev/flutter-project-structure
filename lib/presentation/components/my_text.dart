import 'dart:io';
import 'package:flutter_structure/utils/my_material.dart';

class MyText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final TextAlign? textAlign;
  MyText(this.text, {required this.style, this.textAlign});
  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return DefaultTextStyle(
          style: style,
          child: Text(
            text,
            textAlign: textAlign,
          ));
    } else {
      return Text(
        text,
        textAlign: textAlign,
        style: style,
      );
    }
  }
}
