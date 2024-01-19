import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uporzadkowane_korepetycje/home/screens/add%20note%20for%20students/add_note_page_content.dart';
import 'package:uporzadkowane_korepetycje/home/screens/row_appbar/calendar/calendar_content_page.dart';
import 'package:uporzadkowane_korepetycje/home/screens/row_appbar/custom_search_delegate/custom_search_delegate_content_page.dart';
import 'package:uporzadkowane_korepetycje/home/screens/row_appbar/profile_page/profile_page.dart';
import 'package:uporzadkowane_korepetycje/home/screens/weekdaypage/cubit/weekday_cubit.dart';

enum _MenuValues { callendar, logout }

class WeekdayPage extends StatelessWidget {
  WeekdayPage({
    required this.title,
    required this.backgroundColor,
    super.key,
  });
  final String title;
  final controller = TextEditingController();
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            PopupMenuButton<_MenuValues>(
              color: Colors.white,
              itemBuilder: (context) => [
                PopupMenuItem(
                    value: _MenuValues.callendar,
                    child: Center(
                      child: Text(
                        'Kalendarz',
                        style: GoogleFonts.kadwa(
                            color: Colors.black, fontSize: 13),
                      ),
                    )),
                PopupMenuItem(
                  value: _MenuValues.logout,
                  child: Center(
                    child: Text(
                      'Profil',
                      style:
                          GoogleFonts.kadwa(color: Colors.black, fontSize: 13),
                    ),
                  ),
                ),
              ],
              onSelected: (value) {
                switch (value) {
                  case _MenuValues.callendar:
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (c) => const CalendarPage()));
                    break;
                  case _MenuValues.logout:
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (c) => const ProfilePage()));
                    break;
                }
              },
            ),
            Center(
              child: Text(
                title,
                style: GoogleFonts.kadwa(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(),
                );
              },
              icon: const Icon(Icons.search),
              color: Colors.white,
            ),
          ],
        ),
        backgroundColor: backgroundColor,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => SimpleDialog(
              title: Text(
                'Imię ucznia',
                style: GoogleFonts.kadwa(),
              ),
              contentPadding: const EdgeInsets.all(20.0),
              children: [
                TextField(controller: controller),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Wróć'),
                ),
                TextButton(
                  onPressed: () {
                    FirebaseFirestore.instance
                        .collection('students')
                        .add({'name': controller.text});
                    controller.clear();

                    Navigator.of(context).pop();
                  },
                  child: const Text('Dodaj'),
                ),
              ],
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: BlocProvider(
        create: (context) => WeekdayCubit()..start(),
        child: BlocBuilder<WeekdayCubit, WeekdayState>(
          builder: (context, state) {
            if (state.errorMessege.isNotEmpty) {
              return const Center(
                child: Text('Wystąpił błąd'),
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
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: <Widget>[
                for (final document in documents) ...[
                  GestureDetector(
                    onLongPress: () {
                      FirebaseFirestore.instance
                          .collection('students')
                          .doc(document.id)
                          .delete();
                    },
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => NotePage(
                            studentId: document.id,
                          ),
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
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9.0),
        color: Colors.white,
      ),
      child: Center(
        child: Text(name),
      ),
    );
  }
}
