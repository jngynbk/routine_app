import 'package:flutter/material.dart';
import 'package:routine_app/screens/todo_screen.dart';

class GroupItemWidget extends StatelessWidget {
  final String title;

  const GroupItemWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => ToDoScreen(title: title)),
        );
      },
    );
  }
}
