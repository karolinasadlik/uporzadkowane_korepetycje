
import 'package:flutter/material.dart';

import 'package:uporzadkowane_korepetycje/home/screens/row_appbar/row_content_page.dart';

import '../floating_action_button/floating_action_button_page.dart';




class Screen6 extends StatelessWidget {
  const Screen6({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        title:const RowForAll(),
        backgroundColor: Colors.yellow,
      ),
      floatingActionButton: FloatingActionButtonForAllScreens(),
      
      
    );
  }
}
