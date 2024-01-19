
import 'package:flutter/material.dart';
import 'package:uporzadkowane_korepetycje/home/screens/add%20note%20for%20students/style_page.dart';

class NoteEditorScreen extends StatefulWidget {
  const NoteEditorScreen({super.key});

  @override
  State<NoteEditorScreen> createState() => _NoteEditorScreenState();
}

class _NoteEditorScreenState extends State<NoteEditorScreen> {
  // int color_id = Random().nextInt(NoteStyle.cardsColor.length);
  String date = DateTime.now().toString();

  TextEditingController titleController = TextEditingController();
  TextEditingController mainController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Dodaj nową notatkę'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Tytuł notatki',
              ),
              style: NoteStyle.mainTitle,
            ),
            const SizedBox(height: 10.0),
            Text(date, style: NoteStyle.dateTime),
            const SizedBox(height: 18.0),
            TextField(
              controller: mainController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Twoja notatka',
              ),
              style: NoteStyle.mainContent,
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     FirebaseFirestore.instance.collection('lessons').add({
      //       "note_title": titleController.text,
      //       "creation_date": date,
      //       "note_content": mainController.text,
      //       "color_id": color_id,
      //     });
      //     Navigator.of(context).pop;
      //   },
      //   backgroundColor: NoteStyle.accentColor,
      //   child: const Icon(Icons.save_rounded),
      // ),
    );
  }
}
