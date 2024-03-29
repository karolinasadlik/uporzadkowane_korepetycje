import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

import 'events.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({
    super.key,
  });

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  CalendarFormat format = CalendarFormat.month;
  DateTime focusedDay = DateTime.now();
  DateTime? selectedDay;
  Map<DateTime, List<Event>> events = {};

  @override
  void initState() {
    super.initState();
    selectedDay = focusedDay;
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusDay) {
    setState(
      () {},
    );
  }

  TextEditingController eventController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  scrollable: true,
                  title: const Text('Wydarzenie'),
                  content: Padding(
                    padding: const EdgeInsets.all(8),
                    child: TextField(controller: eventController),
                  ),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Zapisz'),
                    ),
                  ],
                );
              });
        },
        label: Text(
          'Zaplanuj',
          style: GoogleFonts.kadwa(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),
        ),
        icon: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.black,
      ),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        // title:  Column(
        // children: [
        // const Text('Kalendarz'),
        // Text(today.toString().split('')[0]),
        // ],
        // ),

        title: Center(
          child: Text(
            'Kalendarz',
            style: GoogleFonts.kadwa(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Text(
              'Wybrany dzień : ${focusedDay.toString()}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            const Divider(
              color: Color.fromARGB(255, 255, 101, 153),
              thickness: 5,
            ),
            const SizedBox(height: 20),
            TableCalendar(
              rowHeight: 70,
              //odstępy miedzy dniami

              firstDay: DateTime.utc(1997, 1, 1),
              lastDay: DateTime.utc(2090, 1, 1),
              focusedDay: focusedDay,
              calendarFormat: format,
              // cos z tym format jest nie tak,
              onFormatChanged: (CalendarFormat format) {
                setState(
                  () {
                    format = format;
                  },
                );
              },
              startingDayOfWeek: StartingDayOfWeek.monday,
              daysOfWeekVisible: true,
              onDaySelected: _onDaySelected,
              selectedDayPredicate: (day) => isSameDay(day, focusedDay),

              calendarStyle: CalendarStyle(
                isTodayHighlighted: true,
                selectedDecoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10)),
                selectedTextStyle: const TextStyle(color: Colors.white),
                //  to jest do zmiany koloru dnia dzisiajszego
                todayDecoration: BoxDecoration(
                  color: const Color.fromARGB(255, 231, 183, 240),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10),
                ),
                defaultDecoration: BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10)),
                weekendDecoration: BoxDecoration(
                    color: const Color.fromARGB(255, 238, 232, 232),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10)),
              ),
              headerStyle: const HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                  formatButtonShowsNext: false,
                  formatButtonDecoration: BoxDecoration()),
              availableGestures: AvailableGestures.all,
            ),
          ],
        ),
      ),
    );
  }
}
