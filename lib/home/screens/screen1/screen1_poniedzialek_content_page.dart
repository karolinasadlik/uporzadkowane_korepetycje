import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Screen1 extends StatelessWidget {
  const Screen1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Center(
          child: Text(
            "Poniedziałek",
            style: GoogleFonts.kadwa(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: const Center(
        child: Center(
          child: Column(
            children: <Widget>[
              Divider(),
              Text("Tutaj tekst"),
              Divider(),
              Text("Tutaj tekst"),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
