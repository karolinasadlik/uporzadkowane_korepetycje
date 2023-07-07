import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../row/row_content_page.dart';

class Screen1 extends StatelessWidget {
  const Screen1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const RowForAll(),
        backgroundColor: Colors.blue,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: Text(
            'Dodaj ucznia',
            style: GoogleFonts.kadwa(fontSize: 20, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
