import 'package:flutter/material.dart';


import '../floating_action_button/floating_action_button_page.dart';
import '../row_appbar/row_content_page.dart';

class Screen1 extends StatelessWidget {
  const Screen1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const RowForAll(),
        backgroundColor: Colors.blue,
      ),
      floatingActionButton: FloatingActionButtonForAllScreens(),
      
    );
  }
}


