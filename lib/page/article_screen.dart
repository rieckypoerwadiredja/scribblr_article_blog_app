import 'package:flutter/material.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Article Screen'),
      ),
      body: const Center(
        child: Text('Welcome to the Article Screen!'),
      ),
    );
  }
}
