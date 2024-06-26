import 'package:flutter/material.dart';

class GroupDialogWidget extends StatefulWidget {
  final Function(String title) onTitleAdded;

  const GroupDialogWidget({
    super.key,
    required this.onTitleAdded,
  });

  @override
  State<GroupDialogWidget> createState() => _GroupDialogWidgetState();
}

class _GroupDialogWidgetState extends State<GroupDialogWidget> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Routine Name'),
      content: TextField(
        controller: _controller,
        decoration: const InputDecoration(hintText: 'Enter group title'),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            widget.onTitleAdded(_controller.text);
            Navigator.of(context).pop();
          }, // Close the dialog
          child: const Text('Done'),
        ),
      ],
    );
  }
}
