import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uporzadkowane_korepetycje/app/features/home/screens/add%20note%20for%20students/note_style_page.dart';

class NoteReaderScreen extends StatefulWidget {
  const NoteReaderScreen(this.doc, {super.key});
  final QueryDocumentSnapshot doc;
  @override
  State<NoteReaderScreen> createState() => _NoteReaderScreenState();
}

class _NoteReaderScreenState extends State<NoteReaderScreen> {
  @override
  Widget build(BuildContext context) {
    int colorId = widget.doc['color_id'];
    return Scaffold(
      backgroundColor: NoteStyle.cardsColor[colorId],
      appBar: AppBar(
        backgroundColor: NoteStyle.cardsColor[colorId],
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.doc['note_title'], style: NoteStyle.mainTitle),
            const SizedBox(
              height: 10,
            ),
            Text(widget.doc['creation_date'], style: NoteStyle.dateTime),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.doc['note_content'],
              style: NoteStyle.mainContent,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
