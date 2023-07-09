import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ElevatedButtonForAll extends StatelessWidget {
  const ElevatedButtonForAll({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        
      },
      child: Text(
        'Dodaj ucznia',
        style: GoogleFonts.kadwa(fontSize: 20, color: Colors.black),
      ),
    );
  }
}
