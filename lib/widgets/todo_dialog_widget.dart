import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToDoDialogWidget extends StatefulWidget {
  final Function(
    String title,
    String emoji,
    Duration duration,
  ) onToDoAdded;

  const ToDoDialogWidget({
    super.key,
    required this.onToDoAdded,
  });

  @override
  State<ToDoDialogWidget> createState() => _ToDoDialogWidgetState();
}

class _ToDoDialogWidgetState extends State<ToDoDialogWidget> {
  final TextEditingController _titleController = TextEditingController();
  String _selectedEmoji = '😀';
  Duration _selectedDuration = Duration(minutes: 1);

  void _showCupertinoTimerPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return SizedBox(
          height: MediaQuery.of(context).copyWith().size.height * 0.25,
          child: CupertinoTimerPicker(
            mode: CupertinoTimerPickerMode.ms,
            initialTimerDuration: _selectedDuration,
            onTimerDurationChanged: (Duration changedTimer) {
              setState(() {
                _selectedDuration = changedTimer;
              });
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add New ToDo'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextField(
            controller: _titleController,
            autofocus: true,
            decoration: InputDecoration(hintText: 'Enter title'),
          ),
          // Simple emoji selection as an example
          DropdownButton<String>(
            value: _selectedEmoji,
            onChanged: (value) {
              setState(() {
                _selectedEmoji = value!;
              });
            },
            items: ['😀', '😂', '🏃', '💡']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          // CupertinoTimerPicker
          TextButton(
            child: Text(
                '${_selectedDuration.inMinutes} min ${_selectedDuration.inSeconds % 60} sec'),
            onPressed: () => _showCupertinoTimerPicker(context),
          )
        ],
      ),
      actions: <Widget>[
        TextButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text('Done'),
          onPressed: () {
            widget.onToDoAdded(
              _titleController.text,
              _selectedEmoji,
              _selectedDuration,
            );
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
