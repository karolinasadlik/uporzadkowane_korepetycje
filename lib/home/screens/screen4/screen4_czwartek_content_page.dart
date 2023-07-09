
import 'package:flutter/material.dart';

import 'package:uporzadkowane_korepetycje/home/screens/row_appbar/row_content_page.dart';

import '../floating_action_button/floating_action_button_page.dart';




class Screen4 extends StatelessWidget {
  const Screen4({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const RowForAll(),
        backgroundColor: Colors.black,
      ),
      floatingActionButton: FloatingActionButtonForAllScreens(),
      
      
    );
  }
}
