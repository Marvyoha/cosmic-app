import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontStyles {
  static TextStyle headerLarge = const TextStyle(
    color: Colors.white,
    fontSize: 32,
    fontWeight: FontWeight.w800,
  );

  static TextStyle headerMedium = const TextStyle(
    color: Colors.white,
    fontSize: 24,
    fontWeight: FontWeight.w800,
  );

  static TextStyle headerSmall = const TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w800,
  );

  static TextStyle cardHeader = FontStyles.headerSmall.copyWith(fontSize: 20);

  static TextStyle cardSubtitle = FontStyles.bodyMedium
      .copyWith(color: Colors.white, fontWeight: FontWeight.normal);

  static TextStyle hintText = const TextStyle(
    color: Colors.white,
    fontSize: 17,
    fontWeight: FontWeight.normal,
  );

  static TextStyle bodyMedium = const TextStyle(
    color: Color(0xFF8C8E99),
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );

  static TextStyle bodySmall = const TextStyle(
    color: Color(0xFF8C8E99),
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );
}
