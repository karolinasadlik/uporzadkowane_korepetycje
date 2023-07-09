
import 'package:flutter/material.dart';

import 'package:uporzadkowane_korepetycje/home/screens/row_appbar/row_content_page.dart';

import '../elevated_button/elevated_button_content_page.dart';


class Screen5 extends StatelessWidget {
  const Screen5({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        title: const RowForAll(),
        backgroundColor: Colors.orange,
      ),
      body: const Center(
        child: ElevatedButtonForAll(),
        
      ),
    );
  }
}
