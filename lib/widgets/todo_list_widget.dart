import 'package:flutter/material.dart';

class ToDo {
  String title;
  String emoji;
  Duration duration;

  ToDo({
    required this.title,
    required this.emoji,
    required this.duration,
  });
}

class ToDoListWidget extends StatelessWidget {
  final List<ToDo> todos;
  final Function(ToDo todo, int index) onToDoTap;

  const ToDoListWidget({
    super.key,
    required this.todos,
    required this.onToDoTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];
        return ListTile(
          leading: Text(todo.emoji),
          title: Text(todo.title),
          subtitle: Text(
              '${todo.duration.inMinutes} min ${todo.duration.inSeconds % 60} sec'),
          onTap: () => onToDoTap(todo, index),
        );
      },
    );
  }
}
