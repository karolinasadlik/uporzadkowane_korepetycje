import 'package:flutter/material.dart';

import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:uporzadkowane_korepetycje/home/screens/screen4/screen4_czwartek_content_page.dart';
import 'package:uporzadkowane_korepetycje/home/screens/screen7/screen7_niedziela_content_page.dart';
import 'package:uporzadkowane_korepetycje/home/screens/screen5/screen5_piatek_content_page.dart';
import 'package:uporzadkowane_korepetycje/home/screens/screen1/screen1_poniedzialek_content_page.dart';
import 'package:uporzadkowane_korepetycje/home/screens/screen6/screen6_sobota_content_page.dart';
import 'package:uporzadkowane_korepetycje/home/screens/screen3/screen3_sroda_content_page.dart';
import 'package:uporzadkowane_korepetycje/home/screens/screen2/screen2_wtorek_content_page.dart';

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
    const Screen1(),
    const Screen2(),
    const Screen3(),
    const Screen4(),
    const Screen5(),
    const Screen6(),
    const Screen7(),
  ];
}
