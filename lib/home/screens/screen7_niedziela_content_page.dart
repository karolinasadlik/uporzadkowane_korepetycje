import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Screen7 extends StatelessWidget {
  const Screen7({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: Center(
          child: Text(
            "Niedziela",
            style: GoogleFonts.kadwa(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.green,
      ),
    );
  }
}