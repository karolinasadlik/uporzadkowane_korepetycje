import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoteStyle {
  static Color backgroundColor = const Color(0xFF000633);
  static Color accentColor = const Color.fromARGB(255, 190, 206, 231);

  static List<Color> cardsColor = [
    Colors.white,
    const Color.fromARGB(255, 139, 236, 142),
    const Color.fromARGB(255, 247, 108, 154),
    const Color.fromARGB(255, 142, 191, 231),
    const Color.fromARGB(255, 243, 158, 31),
    const Color.fromARGB(255, 213, 102, 233),
  ];

  static TextStyle mainTitle = GoogleFonts.kadwa(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
  static TextStyle mainContent = GoogleFonts.kadwa(
    fontSize: 15,
    fontWeight: FontWeight.normal,
  );
  static TextStyle dateTime = GoogleFonts.kadwa(
    fontSize: 13,
    fontWeight: FontWeight.normal,
  );
}
