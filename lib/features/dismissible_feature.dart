import 'package:flutter/material.dart';

class DismissibleFeature extends StatelessWidget {
  final Widget child;
  final String keyString;
  final String item; // Assuming the item is just a string for simplicity
  final Function(String item) onUndo; // Callback for undo
  final int index;

  const DismissibleFeature({
    super.key,
    required this.child,
    required this.keyString,
    required this.item,
    required this.onUndo,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(keyString),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$item dismissed'),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () => onUndo(item),
            ),
          ),
        );
      },
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Icon(Icons.delete, color: Colors.white),
      ),
      child: child,
    );
  }
}
