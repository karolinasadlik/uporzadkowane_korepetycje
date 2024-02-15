import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uporzadkowane_korepetycje/app/features/home/screens/add%20note%20for%20students/note_style_page.dart';

Widget noteBox(Function()? onTap, QueryDocumentSnapshot doc) {
  // print(doc.data());
  Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(9.0),
      margin: const EdgeInsets.all(9.0),
      // decoration: BoxDecoration(
      //   // color: NoteStyle.cardsColor[data['color_id']],
      //   borderRadius: BorderRadius.circular(9.0),
      // ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(data['note_title'], style: NoteStyle.mainTitle),
          const SizedBox(
            height: 10,
          ),
          Text(data['creation_date'], style: NoteStyle.dateTime),
          const SizedBox(
            height: 10,
          ),
          Text(
            data['note_content'],
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
