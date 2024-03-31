import 'package:flutter/material.dart';

class ToDoScreen extends StatelessWidget {
  final String title;

  const ToDoScreen({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title), // Display the tapped group title
      ),
      // Additional implementation...
    );
  }
}
