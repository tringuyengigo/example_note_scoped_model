import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'note_header_row.dart';
import 'note_listview.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          NoteHeaderRowWidget(),
          Expanded(child: NoteListViewWidget()),
        ],
      ),
    );
  }
}
