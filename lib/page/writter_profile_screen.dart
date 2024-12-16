import 'package:flutter/material.dart';

class WritterProfileScreen extends StatelessWidget {
  const WritterProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Writter Profile Screen'),
      ),
      body: const Center(
        child: Text('Welcome to the Writter Profile Screen!'),
      ),
    );
  }
}
