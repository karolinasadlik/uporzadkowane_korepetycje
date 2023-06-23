import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:uporzadkowane_korepetycje/home/screens/screen4_czwartek_content_page.dart';
import 'package:uporzadkowane_korepetycje/home/screens/screen7_niedziela_content_page.dart';
import 'package:uporzadkowane_korepetycje/home/screens/screen5_piatek_content_page.dart';
import 'package:uporzadkowane_korepetycje/home/screens/screen1_poniedzialek_content_page.dart';
import 'package:uporzadkowane_korepetycje/home/screens/screen6_sobota_content_page.dart';
import 'package:uporzadkowane_korepetycje/home/screens/screen3_sroda_content_page.dart';
import 'package:uporzadkowane_korepetycje/home/screens/screen2_wtorek_content_page.dart';

class HomePage extends StatelessWidget {
  HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LiquidSwipe(
        pages: pages,
        enableLoop: true,
        fullTransitionValue: 300,
        slideIconWidget:
            const Icon(Icons.arrow_back_ios, size: 40, color: Colors.white),
        waveType: WaveType.liquidReveal,
        positionSlideIcon: 0.5,
      ),
    );
  }

  final pages = [
    Screen1(),
    Screen2(),
    Screen3(),
    Screen4(),
    Screen5(),
    Screen6(),
    Screen7(),
  ];
}
