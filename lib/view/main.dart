import 'package:example_03_expense_calculator/viewmodel/note_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:example_03_expense_calculator/view/note_body_container.dart';
import 'package:scoped_model/scoped_model.dart';

void main() {
  runApp(MyNote());
}

class MyNote extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: MyHomePage(title: 'My Note'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: NoteViewModel.getInstance(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(this.title),
          centerTitle: true,
        ),
        body: NoteBodyWidget(),
      ),
    );
  }
}

class NoteBodyWidget extends StatelessWidget {
  const NoteBodyWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContainerWidget();
  }
}
