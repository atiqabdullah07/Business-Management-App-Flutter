import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppText extends StatelessWidget {
  final String title;
  final double size;
  final bool? isTextAlign;
  final FontWeight fontWeight;
  final Color? color;
  final bool? isTextUnderLine;
  const AppText({
    Key? key,
    required this.title,
    required this.color,
    required this.size,
    required this.fontWeight,
    this.isTextAlign,
    this.isTextUnderLine,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: isTextAlign == true ? TextAlign.center : TextAlign.start,
      title,
      style: GoogleFonts.manrope(
        textStyle: TextStyle(
          fontSize: size,
          fontWeight: fontWeight,
          color: color,
          decoration: isTextUnderLine == true
              ? TextDecoration.underline
              : TextDecoration.none,
        ),
      ),
    );
  }
}
