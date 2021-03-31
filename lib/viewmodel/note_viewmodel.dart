import 'package:example_03_expense_calculator/model/note.dart';
import 'package:example_03_expense_calculator/data/note_repo_impl.dart';
import 'package:scoped_model/scoped_model.dart';

class NoteViewModel extends Model {
  static const String TAG = "[NoteViewModel]";
  NoteRepoImpl mNoteRepoImpl = NoteRepoImpl();
  static NoteViewModel _instance;

  static NoteViewModel getInstance() {
    print(TAG + 'getInstance() -> start');
    if (_instance == null) {
      _instance = NoteViewModel();
    }
    return _instance;
  }


  Future<int> saveNote(Note mNote) async {
    print(TAG + 'saveNote() -> mNote: $mNote');

    Future<int> resultTemp = mNoteRepoImpl.saveNote(mNote);
    notifyListeners();
    return resultTemp;
  }

  void removeNote(Note mNote) async {
    mNoteRepoImpl.removeNote(mNote);
    notifyListeners();
  }

  Future<List<Note>> getAllNote() {
    Future<List<Note>> resultTemp = mNoteRepoImpl.getAllNote();
    notifyListeners();
    return resultTemp;
  }


}
