
import 'package:flutter/material.dart';

import 'package:uporzadkowane_korepetycje/home/screens/row_appbar/row_content_page.dart';

import '../elevated_button/elevated_button_content_page.dart';


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
      body: const Center(
        child: ElevatedButtonForAll(),
        
      ),
    );
  }
}
