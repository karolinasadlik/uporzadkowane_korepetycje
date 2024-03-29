import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:uporzadkowane_korepetycje/app/features/home/screens/add%20note%20for%20students/note_page/note_page.dart';
import 'package:uporzadkowane_korepetycje/app/features/home/screens/appBar/calendar/calendar_content_page.dart';
import 'package:uporzadkowane_korepetycje/app/features/home/screens/weekdaypage/cubit/weekday_cubit.dart';

enum MenuItem { calendar, profile }

// ignore: must_be_immutable
class WeekdayPage extends StatelessWidget {
  WeekdayPage({
    required this.title,
    required this.backgroundColor,
    required this.today,
    super.key,
  });
  final String title;
  final Color backgroundColor;
  DateTime today = DateTime.now();

  final controller = TextEditingController();

  String releaseDate() {
    return DateFormat.MMMd().format(today);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.shadowsIntoLight(
                    fontSize: 30, color: Colors.white, letterSpacing: 4),
              ),
              Text(
                releaseDate(),
                style: GoogleFonts.shadowsIntoLight(
                    color: Colors.white, fontSize: 20, letterSpacing: 3),
              ),
            ],
          ),
          backgroundColor: backgroundColor,
          actions: [
            PopupMenuButton<MenuItem>(
              color: const Color.fromARGB(255, 253, 137, 137),
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: MenuItem.calendar,
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Icon(Icons.calendar_month,
                              color: Colors.white, size: 20),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            'Kalendarz',
                            style: GoogleFonts.shadowsIntoLight(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20,
                                letterSpacing: 3),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: MenuItem.profile,
                  child: Column(children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(Icons.person_2_rounded,
                            color: Colors.white, size: 20),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          'Profil',
                          style: GoogleFonts.shadowsIntoLight(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20,
                              letterSpacing: 3),
                        ),
                      ],
                    ),
                  ]),
                ),
              ],
              onSelected: (value) {
                if (value == MenuItem.calendar) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const CalendarPage(),
                    ),
                  );
                } else if (value == MenuItem.profile) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const CalendarPage(),
                    ),
                  );
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Menu',
                  style: GoogleFonts.shadowsIntoLight(
                      color: Colors.white, fontSize: 30, letterSpacing: 3),
                ),
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 184, 178, 178),
          shape: const CircleBorder(
            side: BorderSide(color: Colors.white),
          ),
          onPressed: () {
            showDialog(
              barrierColor: const Color.fromARGB(255, 236, 159, 185),
              context: context,
              builder: (context) => SimpleDialog(
                title: Text(
                  'Imię ucznia',
                  style: GoogleFonts.shadowsIntoLight(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      letterSpacing: 3),
                ),
                contentPadding: const EdgeInsets.all(10.0),
                children: [
                  TextField(
                    style: GoogleFonts.shadowsIntoLight(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 5,
                      color: const Color.fromARGB(255, 236, 159, 185),
                    ),
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: 'Imię ucznia...',
                      hintStyle: GoogleFonts.shadowsIntoLight(
                          color: const Color.fromARGB(255, 236, 159, 185),
                          fontSize: 20),
                      prefixIcon: const Icon(
                        Icons.person,
                        color: Color.fromARGB(255, 236, 159, 185),
                      ),

                      fillColor: Colors.transparent,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 1, 30, 53)),
                      ),
                      //bez enabledBorder wyszukiwarka nie wygląda tak jak ją zmieniono
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextButton(
                    onPressed: () {
                      FirebaseFirestore.instance
                          .collection('students')
                          .add({'name': controller.text});
                      controller.clear();

                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Dodaj',
                      style: GoogleFonts.shadowsIntoLight(
                          fontSize: 40,
                          color: const Color.fromARGB(255, 11, 117, 14),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Wróć',
                      style: GoogleFonts.shadowsIntoLight(
                          fontSize: 40,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            );
          },
          child: const Icon(Icons.add, color: Colors.white),
        ),
        body: BlocProvider(
          create: (context) => WeekdayCubit()..start(),
          child: BlocBuilder<WeekdayCubit, WeekdayState>(
            builder: (context, state) {
              if (state.errorMessege.isNotEmpty) {
                return Center(
                  child: Text(
                    'Wystąpił błąd',
                    style: GoogleFonts.shadowsIntoLight(),
                  ),
                );
              }
              if (state.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              final documents = state.documents;

              return GridView.count(
                primary: false,
                padding: const EdgeInsets.all(80),
                crossAxisSpacing: 30,
                mainAxisSpacing: 30,
                crossAxisCount: 2,
                children: <Widget>[
                  for (final document in documents) ...[
                    GestureDetector(
                      onLongPress: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: Colors.white,
                                icon: const Icon(Icons.info, color: Colors.red),
                                title: Text(
                                  'Na pewno chcesz to usunąć?',
                                  style: GoogleFonts.shadowsIntoLight(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                content: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color.fromARGB(
                                              255, 7, 118, 11)),
                                      onPressed: () {
                                        FirebaseFirestore.instance
                                            .collection('students')
                                            .doc(document.id)
                                            .delete();

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
                                          backgroundColor: const Color.fromARGB(
                                              255, 190, 17, 4)),
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
                      },
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const NotePage(),
                          ),
                        );
                      },
                      child: StudentsContainer(
                        document['name'],
                      ),
                    ),
                  ],
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class StudentsContainer extends StatelessWidget {
  const StudentsContainer(
    this.name, {
    super.key,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 223, 218, 218),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 5),
          ),
        ],
        borderRadius: BorderRadius.circular(4.0),
        color: Colors.white,
      ),
      child: Center(
        child: Text(
          name,
          style: GoogleFonts.shadowsIntoLight(
              fontWeight: FontWeight.bold, fontSize: 30, letterSpacing: 4),
        ),
      ),
    );
  }
}
