import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextUtils extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextDecoration underline;

  const TextUtils({
    super.key,
    required this.text,
    required this.color,
    required this.fontSize,
    required this.fontWeight,
    required this.underline,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.lato(
        textStyle: TextStyle(
          decoration: TextDecoration.none,
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
