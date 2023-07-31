import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TableHeaderText extends StatelessWidget {
  final String title;
  final double? size;
  final bool? isTextAlign;
  final FontWeight fontWeight;
  final Color color;
  final bool? isTextUnderLine;
  const TableHeaderText({
    Key? key,
    required this.title,
    required this.color,
    this.size,
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
          fontSize: size ?? 12.sp,
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

//Table Rows Text
class TableRowsText extends StatelessWidget {
  final String title;
  final double? size;
  final bool? isTextAlign;
  final FontWeight fontWeight;
  final Color color;
  final bool? isTextUnderLine;
  const TableRowsText({
    Key? key,
    required this.title,
    required this.color,
    this.size,
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
          fontSize: size ?? 12.sp,
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

// drop down text
class DropDownText extends StatelessWidget {
  final String title;
  final double? size;
  final bool? isTextAlign;
  final FontWeight fontWeight;
  final Color color;
  final bool? isTextUnderLine;
  const DropDownText({
    Key? key,
    required this.title,
    required this.color,
    this.size,
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
          fontSize: size ?? 12.sp,
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
