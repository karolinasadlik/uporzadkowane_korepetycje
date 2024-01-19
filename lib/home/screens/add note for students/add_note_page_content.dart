import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uporzadkowane_korepetycje/home/screens/add%20note%20for%20students/note_editor.dart';
import 'package:uporzadkowane_korepetycje/home/screens/add%20note%20for%20students/note_reader.dart';
import 'package:uporzadkowane_korepetycje/home/screens/add%20note%20for%20students/style_page.dart';
import 'package:uporzadkowane_korepetycje/home/screens/add%20note%20for%20students/widget_note_box_page.dart';

class NotePage extends StatefulWidget {
  const NotePage({
    super.key,
    required this.studentId,
  });

  final String studentId;

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NoteStyle.backgroundColor,
      appBar: AppBar(
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          'Notatka',
          style: GoogleFonts.kadwa(
              color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: NoteStyle.backgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ostatnie notatki',
              style: GoogleFonts.kadwa(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: FirebaseFirestore.instance
                    .collection('lessons')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasData) {
                    final notes = snapshot.data!.docs
                        .where((note) => note['student_id'] == widget.studentId)
                        .map((note) => noteBox(() {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => NoteReaderScreen(note)));
                            }, note))
                        .toList();
                    return GridView(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      children: notes,
                    );
                  }
                  return Text(
                    'Brak notatek',
                    style: GoogleFonts.kadwa(
                      fontSize: 17,
                      color: Colors.white,
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => const NoteEditorScreen(),
            ),
          );
        },
        label: Text(
          'Dodaj notatkę',
          style: GoogleFonts.kadwa(fontSize: 15, color: Colors.black),
        ),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
