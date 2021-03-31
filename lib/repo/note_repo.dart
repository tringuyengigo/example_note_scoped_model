
import 'package:example_03_expense_calculator/model/note.dart';

abstract class NoteRepo {
  Future<int> saveNote(Note mNote);
  void removeNote(Note mNote);
  Future<List<Note>> getAllNote();

}