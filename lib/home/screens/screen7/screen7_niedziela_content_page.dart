import 'package:flutter/material.dart';

import 'package:uporzadkowane_korepetycje/home/screens/row_appbar/row_content_page.dart';



class Screen7 extends StatelessWidget {
  const Screen7({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: const RowForAll(),
        backgroundColor: Colors.green,
      ),
      
    );
  }
}
