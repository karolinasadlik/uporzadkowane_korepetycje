import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Center(
            child: Text(
          "Dzień tygodnia",
          style: TextStyle(color: Colors.white),
        )),
        backgroundColor: Colors.purple,
      ),
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.purple,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(20),
            child: const Center(child: Text('PONIEDZIAŁEK')),
          ),
        ],
      ),
    );
  }
}
