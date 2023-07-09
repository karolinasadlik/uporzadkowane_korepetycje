import 'package:flutter/material.dart';

import '../elevated_button/elevated_button_content_page.dart';
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: const Center(
        child: ElevatedButtonForAll(),
      ),
    );
  }
}


