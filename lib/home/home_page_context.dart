import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Center(
            child: Text(
          "Dzień tygodnia",
          style: GoogleFonts.alkatra(fontSize: 30, color: Colors.white),
        )),
        backgroundColor: Colors.purple,
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('lessons').snapshots(),
          builder: (context, snapshot) {
            return ListView(
              children: const [
                WeekDayContainer('poniedziałek'),
                WeekDayContainer('wtorek'),
                WeekDayContainer('sroda'),
              ],
            );
          }),
    );
  }
}

class WeekDayContainer extends StatelessWidget {
  const WeekDayContainer(
    this.weekday, {
    super.key,
  });

  final String weekday;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.purple,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Text(
          weekday,
          style: GoogleFonts.alkatra(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
