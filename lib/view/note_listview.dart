import 'package:example_03_expense_calculator/model/note.dart';
import 'package:example_03_expense_calculator/viewmodel/note_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class NoteListViewWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ToDoListState();
  }
}

class _ToDoListState extends State<NoteListViewWidget> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant < NoteViewModel > (builder: (BuildContext context, Widget child, NoteViewModel model) {
      return StreamBuilder<List<Note>>(
          stream: model.getAllNote().asStream(),
          builder: (context, snap) {
            return ListView.builder(
                itemCount: snap.data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('${snap.data[index].description}', style: TextStyle(fontSize: 18)),
                    trailing: GestureDetector(
                      onTap: () {
                        print('Delete item $index');
                        model.removeNote(snap.data[index]);
                      },
                      child: Icon(Icons.delete),
                    ),
                  );
                });
          }
      );
    });
  }
}
