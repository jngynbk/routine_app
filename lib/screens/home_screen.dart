import 'package:flutter/material.dart';
import 'package:routine_app/widgets/group_dialog_widget.dart';
import 'package:routine_app/widgets/group_item_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _groupTitles = [];

  void _addNewGroup(String title) {
    setState(() {
      _groupTitles.add(title);
    });
  }

  void _removeGroup(String title, int index) {
    setState(() {
      _groupTitles.removeAt(index);
    });

    // Show a Snackbar with an Undo option
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$title removed'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _groupTitles.insert(index, title);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
        elevation: 2,
        surfaceTintColor: Colors.white,
        shadowColor: Colors.black26,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => showDialog(
              context: context,
              builder: (BuildContext context) {
                return GroupDialogWidget(onTitleAdded: _addNewGroup);
              },
            ),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: _groupTitles.length,
        itemBuilder: (context, index) {
          final item = _groupTitles[index];
          return Dismissible(
            key: Key(item),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              _removeGroup(item, index);
            },
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            child: GroupItemWidget(title: item),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
            context: context,
            builder: (BuildContext context) {
              return GroupDialogWidget(onTitleAdded: _addNewGroup);
            }),
        tooltip: 'Add a new group',
        child: const Icon(Icons.add),
      ),
    );
  }
}
