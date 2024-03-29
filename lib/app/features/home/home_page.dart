import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:uporzadkowane_korepetycje/app/features/home/screens/weekdaypage/weekday_content_page.dart';

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
            backgroundColor: const Color.fromARGB(255, 160, 199, 231),
            today: (DateTime.now()),
          ),
          WeekdayPage(
            title: 'Wtorek',
            backgroundColor: const Color.fromARGB(255, 236, 93, 141),
            today: (DateTime.now()),
          ),
          WeekdayPage(
            title: "Środa",
            backgroundColor: const Color.fromARGB(255, 197, 134, 208),
            today: (DateTime.now()),
          ),
          WeekdayPage(
            title: 'Czwartek',
            backgroundColor: Colors.black,
            today: (DateTime.now()),
          ),
          WeekdayPage(
            title: 'Piątek',
            backgroundColor: const Color.fromARGB(255, 255, 167, 123),
            today: (DateTime.now()),
          ),
          WeekdayPage(
            title: 'Sobota',
            backgroundColor: const Color.fromARGB(255, 4, 2, 52),
            today: (DateTime.now()),
          ),
          WeekdayPage(
            title: 'Niedziela',
            backgroundColor: const Color.fromARGB(255, 160, 224, 163),
            today: (DateTime.now()),
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
