import 'package:flutter/material.dart';

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
        // Here you can define what happens when the item is tapped.
      },
    );
  }
}
