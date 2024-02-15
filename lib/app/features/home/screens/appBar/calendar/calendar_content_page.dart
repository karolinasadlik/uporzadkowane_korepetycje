import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({
    super.key,
  });

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
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
        title: Center(
          child: Text(
            'Kalendarz',
            style: GoogleFonts.kadwa(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: TableCalendar(
        firstDay: DateTime(1950),
        lastDay: DateTime(2090),
        focusedDay: selectedDay,
        calendarFormat: format,
        // cos z tym format jest nie tak,
        onFormatChanged: (CalendarFormat _format) {
          setState(
            () {
              format = _format;
            },
          );
        },
        startingDayOfWeek: StartingDayOfWeek.monday,
        daysOfWeekVisible: true,
        onDaySelected: (DateTime selectDay, DateTime focusDay) {
          setState(() {
            selectedDay = selectDay;
            focusedDay = focusDay;
          });
        },
        selectedDayPredicate: (DateTime date) {
          return isSameDay(selectedDay, date);
        },
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
            formatButtonVisible: true,
            titleCentered: true,
            formatButtonShowsNext: false,
            formatButtonDecoration: BoxDecoration()),
      ),
    );
  }
}
