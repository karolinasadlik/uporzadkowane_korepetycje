import 'package:flutter/material.dart';

class LogOutPage extends StatelessWidget {
  const LogOutPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Wyloguj się',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.yellow,
      ),
    );
  }
}
