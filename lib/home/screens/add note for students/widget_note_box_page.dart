import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uporzadkowane_korepetycje/home/screens/add%20note%20for%20students/style_page.dart';

Widget noteBox(Function()? onTap, QueryDocumentSnapshot doc) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(9.0),
      margin: const EdgeInsets.all(9.0),
      decoration: BoxDecoration(
        color: NoteStyle.cardsColor[doc['color_id']],
        borderRadius: BorderRadius.circular(9.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(doc['note_title'], style: NoteStyle.mainTitle),
          const SizedBox(
            height: 10,
          ),
          Text(doc['creation_date'], style: NoteStyle.dateTime),
          const SizedBox(
            height: 10,
          ),
          Text(
            doc['note_content'],
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
