import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uporzadkowane_korepetycje/app/features/home/screens/add%20note%20for%20students/note_model/note.dart';

class NewNoteScreen extends StatefulWidget {
  final Note? note;
  const NewNoteScreen({super.key, this.note});

  @override
  State<NewNoteScreen> createState() => _NewNoteScreenState();
}

class _NewNoteScreenState extends State<NewNoteScreen> {
   TextEditingController _titleController = TextEditingController();
   TextEditingController _contentController = TextEditingController();

  @override
  void initState() {
    if(widget.note !=null ){
_titleController = TextEditingController(text: widget.note!.title);
      _contentController = TextEditingController(text: widget.note!.content);
    super.initState();
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 240, 105, 105),
        title: Center(
          child: Text(
            'Dodaj notatkę',
            style: GoogleFonts.shadowsIntoLight(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Colors.white,
              letterSpacing: 5,
            ),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextField(
            controller: _titleController,
            style: GoogleFonts.shadowsIntoLight(
                fontSize: 30, letterSpacing: 5, fontWeight: FontWeight.bold),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Tytuł',
              hintStyle: GoogleFonts.shadowsIntoLight(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                letterSpacing: 5,
                color: const Color.fromARGB(255, 240, 105, 105),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            maxLines: null,
            controller: _contentController,
            style: GoogleFonts.shadowsIntoLight(
              fontSize: 20,
              letterSpacing: 5,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Miejsce na notatkę',
              hintStyle: GoogleFonts.shadowsIntoLight(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: 5,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 20,
        backgroundColor: const Color.fromARGB(255, 240, 105, 105),
        onPressed: () {
          //zapis pop po navigator daje możliwość dopisania po context innych parametrów
          Navigator.pop(
              context, [_titleController.text, _contentController.text]);
        },
        child: const Icon(
          Icons.save,
          color: Colors.white,
        ),
      ),
    );
  }
}
