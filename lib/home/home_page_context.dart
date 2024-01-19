import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:uporzadkowane_korepetycje/home/screens/weekdaypage/weekday_content_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LiquidSwipe(
        pages: [
          WeekdayPage(
            title: 'Poniedziałek',
            backgroundColor: Colors.blue,
          ),
          WeekdayPage(
            title: 'Wtorek',
            backgroundColor: Colors.pink,
          ),
          WeekdayPage(
            title: "Środa",
            backgroundColor: Colors.purple,
          ),
          WeekdayPage(
            title: 'Czwartek',
            backgroundColor: Colors.black,
          ),
          WeekdayPage(
            title: 'Piątek',
            backgroundColor: Colors.orange,
          ),
          WeekdayPage(
            title: 'Sobota',
            backgroundColor: Colors.yellow,
          ),
          WeekdayPage(
            title: 'Niedziela',
            backgroundColor: Colors.green,
          ),
        ],
        enableLoop: true,
        fullTransitionValue: 300,
        slideIconWidget:
            const Icon(Icons.arrow_back_ios, size: 40, color: Colors.white),
        waveType: WaveType.liquidReveal,
        positionSlideIcon: 0.5,
      ),
    );
  }
}
