// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uporzadkowane_korepetycje/home/screens/row/calendar/calendar_content_page.dart';
import 'package:uporzadkowane_korepetycje/home/screens/row/custom_search_delegate/custom_search_delegate_content_page.dart';
import 'package:uporzadkowane_korepetycje/home/screens/row/log_out_page/log_out_content_page.dart';

enum _MenuValues { callendar, logout }

class RowForAll extends StatelessWidget {
  const RowForAll({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        PopupMenuButton<_MenuValues>(
          color: Colors.white,
          itemBuilder: (context) => [
            PopupMenuItem(
                child: Center(
                  child: Text(
                    'Kalendarz',
                    style: GoogleFonts.kadwa(color: Colors.black, fontSize: 13),
                  ),
                ),
                value: _MenuValues.callendar),
            PopupMenuItem(
              child: Center(
                child: Text(
                  'Wyloguj się',
                  style: GoogleFonts.kadwa(color: Colors.black, fontSize: 13),
                ),
              ),
              value: _MenuValues.logout,
            ),
          ],
          onSelected: (value) {
            switch (value) {
              case _MenuValues.callendar:
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (c) => CalendarPage()));
                break;
              case _MenuValues.logout:
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (c) => LogOutPage()));
                break;
            }
          },
        ),
        Center(
          child: Text(
            "Poniedziałek",
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
          icon: Icon(Icons.search),
          color: Colors.white,
        ),
      ],
    );
  }
}
