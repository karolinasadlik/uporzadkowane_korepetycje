import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:uporzadkowane_korepetycje/app/features/home/screens/add%20note%20for%20students/add%20new%20note%20screen/new_note_screen.dart';
import 'package:uporzadkowane_korepetycje/app/features/home/screens/add%20note%20for%20students/colors.dart';
import 'package:uporzadkowane_korepetycje/app/features/home/screens/add%20note%20for%20students/note_model/note.dart';

class NotePage extends StatefulWidget {
  const NotePage({super.key});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  List<Note> filteredNotes = [];
  bool sorted = false;

  @override
  void initState() {
    super.initState();
    filteredNotes = sampleNotes;
  }

  List<Note> sortNotesByModifiedTime(List<Note> notes) {
    if (sorted) {
      notes.sort((a, b) => a.modifiedTime.compareTo(b.modifiedTime));
    } else {
      notes.sort((b, a) => a.modifiedTime.compareTo(b.modifiedTime));
    }

    sorted = !sorted;
    return notes;
  }

  getRandomColor() {
    Random random = Random();
    return noteColors[random.nextInt(noteColors.length)];
  }

  void onSearchText(String searchText) {
    setState(() {
      filteredNotes = sampleNotes
          .where(
            (note) =>
                note.content.toLowerCase().contains(
                      searchText.toLowerCase(),
                    ) ||
                note.title.toLowerCase().contains(
                      searchText.toLowerCase(),
                    ),
          )
          .toList();
    });
  }

  void deleteNote(int index) {
    setState(() {
      Note note = filteredNotes[index];
      sampleNotes.remove(note);
      filteredNotes.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 133, 180, 205),
            Color.fromARGB(255, 235, 159, 249),
          ], begin: Alignment.centerLeft, end: Alignment.centerRight),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            16,
            30,
            16,
            0,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: Navigator.of(context).pop,
                    icon: const Icon(Icons.arrow_back_rounded),
                    color: Colors.white,
                  ),
                  Text(
                    'Notatki',
                    style: GoogleFonts.shadowsIntoLight(
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                        color: Colors.white,
                        letterSpacing: 5),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        filteredNotes = sortNotesByModifiedTime(filteredNotes);
                      });
                    },
                    icon: const Icon(
                      Icons.sort,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                style: GoogleFonts.shadowsIntoLight(
                  fontSize: 15,
                  letterSpacing: 5,
                  color: Colors.white,
                ),
                onChanged: onSearchText,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  hintText: 'Wyszukaj',
                  hintStyle: GoogleFonts.shadowsIntoLight(
                      color: Colors.white, letterSpacing: 1),
                  prefixIcon: const Icon(
                    Icons.search_rounded,
                    color: Colors.white,
                  ),
                  fillColor: Colors.transparent,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: const BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  //bez enabledBorder wyszukiwarka nie wygląda tak jak ją zmieniono
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: const BorderSide(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: filteredNotes.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: getRandomColor(),
                      //elevation daje cien pod okienkiem dzięki temu wygląda na 3d
                      elevation: 10,
                      shadowColor: const Color.fromARGB(255, 255, 216, 159),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: const BorderSide(
                          color: Colors.white,
                          width: 2,
                        ),
                      ),
                      margin: const EdgeInsets.all(10),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: ListTile(
                          onTap: () async {
                            final result = await Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    NewNoteScreen(note: filteredNotes[index]),
                              ),
                            );
                            if (result != null) {
                              setState(() {
                                int originalIndex =
                                    sampleNotes.indexOf(filteredNotes[index]);

                                sampleNotes[originalIndex] = Note(
                                  id: sampleNotes[originalIndex].id,
                                  title: result[0],
                                  content: result[1],
                                  modifiedTime: DateTime.now(),
                                );
                                filteredNotes[index] = Note(
                                  id: filteredNotes[originalIndex].id,
                                  title: result[0],
                                  content: result[1],
                                  modifiedTime: DateTime.now(),
                                );
                              });
                            }
                          },
                          title: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              RichText(
                                maxLines: 1,
                                text: TextSpan(
                                  text:
                                      filteredNotes[index].title.toUpperCase(),
                                  style: GoogleFonts.shadowsIntoLight(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  text: filteredNotes[index].content,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                          subtitle: Column(
                            children: [
                              Text(
                                sampleNotes[index].content,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                ' Dodano:  ${DateFormat.yMMMd().format(filteredNotes[index].modifiedTime)}',
                                style: GoogleFonts.shadowsIntoLight(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 17,
                                    letterSpacing: 2),
                              ),
                            ],
                          ),
                          trailing: Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                  colors: [
                                    Color.fromARGB(255, 133, 180, 205),
                                    Color.fromARGB(255, 235, 159, 249),
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight),
                            ),
                            child: IconButton(
                              color: Colors.white,
                              onPressed: () {
                                confirmationDialog(context, index);
                                deleteNote(index);
                              },
                              icon: const Icon(Icons.delete),
                              iconSize: 25,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 20,
        backgroundColor: const Color.fromARGB(255, 133, 180, 205),
        shape: const CircleBorder(
          side: BorderSide(color: Colors.white),
        ),
        onPressed: () async {
          final result = await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const NewNoteScreen(),
            ),
          );
          if (result != null) {
            setState(() {
              sampleNotes.add(
                Note(
                  id: sampleNotes.length,
                  title: result[0],
                  content: result[1],
                  modifiedTime: DateTime.now(),
                ),
              );
              filteredNotes = sampleNotes;
            });
          }
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Future<dynamic> confirmationDialog(BuildContext context, int index) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            icon: const Icon(Icons.info, color: Colors.red),
            title: Text(
              'Na pewno chcesz to usunąć?',
              style: GoogleFonts.shadowsIntoLight(
                  color: Colors.black, fontWeight: FontWeight.bold),
            ),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 7, 118, 11)),
                  onPressed: () {
                    deleteNote(index);
                    Navigator.of(context).pop;
                  },
                  child: SizedBox(
                    width: 60,
                    child: Text(
                      'TAK',
                      style: GoogleFonts.shadowsIntoLight(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 190, 17, 4)),
                  onPressed: () {
                    Navigator.of(context).pop;
                  },
                  child: SizedBox(
                    width: 60,
                    child: Text(
                      'NIE',
                      style: GoogleFonts.shadowsIntoLight(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
