import 'package:example_03_expense_calculator/model/note.dart';
import 'package:example_03_expense_calculator/viewmodel/note_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class NoteHeaderRowWidget extends StatelessWidget {
  const NoteHeaderRowWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _noteController = TextEditingController();

    return ScopedModelDescendant<NoteViewModel>(
      builder: (BuildContext context, Widget child, NoteViewModel model) {
        return Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _noteController,
                style: TextStyle(fontSize: 18),
                decoration: InputDecoration(
                  hintText: 'Enter your note',
                  labelStyle: TextStyle(fontSize: 18),
                ),
              ),
            ),
            RaisedButton(
              child: Icon(Icons.add),
              onPressed: () {
                // print('Add note: ${_noteController.value.text}');
                model.saveNote(Note(null, _noteController.value.text));
              },
            )
          ],
        );
      },
    );
  }
}
