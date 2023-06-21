import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          "Dzień tygodnia",
          style: TextStyle(color: Colors.white),
        )),
        backgroundColor: const Color.fromARGB(255, 112, 13, 6),
      ),
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.red,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            margin: EdgeInsets.all(40),
            padding: EdgeInsets.all(40),
            child: Text('PONIEDZIAŁEK'),
          ),
          Container(
            padding: EdgeInsets.all(30),
            margin: EdgeInsets.all(
              30,
            ),
            color: Colors.white,
            child: Text('WTOREK'),
          ),
          Container(
            padding: EdgeInsets.all(30),
            margin: EdgeInsets.all(
              30,
            ),
            color: Colors.white,
            child: Text('ŚRODA'),
          ),
          Container(
            padding: EdgeInsets.all(30),
            margin: EdgeInsets.all(
              30,
            ),
            color: Colors.white,
            child: Text('CZWARTEK'),
          ),
          Container(
            padding: EdgeInsets.all(30),
            margin: EdgeInsets.all(
              30,
            ),
            color: Colors.white,
            child: Text('PIĄTEK'),
          ),
          Container(
            padding: EdgeInsets.all(30),
            margin: EdgeInsets.all(
              30,
            ),
            color: Colors.white,
            child: Text('SOBOTA'),
          ),
          Container(
            padding: EdgeInsets.all(30),
            margin: EdgeInsets.all(
              30,
            ),
            color: Colors.white,
            child: Text('NIEDZIELA'),
          ),
        ],
      ),
    );
  }
}
