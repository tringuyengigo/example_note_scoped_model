
import 'package:example_03_expense_calculator/data/local/note_dao.dart';
import 'package:example_03_expense_calculator/model/note.dart';
import '../repo/note_repo.dart';

class NoteRepoImpl with NoteRepo {

  NoteDao noteDao = NoteDao();

  @override
  Future<int> saveNote(Note mNote) async {
    return noteDao.saveWeather(mNote);
  }



  @override
  void removeNote(Note mNote) {
    noteDao.removeNote(mNote);
  }

  @override
  Future<List<Note>> getAllNote() {
    return noteDao.getAllNote();
  }

}