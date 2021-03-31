import 'package:example_03_expense_calculator/model/note.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class NoteDao {
  static const String TAG = "[NoteDao]";
  static const String TABLE_NAME = "note";
  static const String ID = "id";
  static const String DESCRIPTION = "description";
  Database mDatabase;

  Future<Database> open() async {
    if (mDatabase == null) {
      var databasePath = await getDatabasesPath();
      print(TAG + "databasePath: $databasePath");
      String path = join(databasePath, 'note_database.db');
      mDatabase = await openDatabase(path, version: 1,
          onCreate: (Database db, int version) async {
        await db.execute(
            "CREATE TABLE IF NOT EXISTS $TABLE_NAME ($ID INTEGER PRIMARY KEY, ""$DESCRIPTION TEXT);");
      });
    }
    return mDatabase;
  }

  Future<void> removeNote(Note mNote) async {
    Database db = await open();
    var result = await db.delete(TABLE_NAME, where: "id = ?", whereArgs: [mNote.id]);
    return result;
  }

  Future<int> saveWeather(Note mNote) async {
    Database db = await open();
    var map = Map<String, dynamic>();
    map["description"] = mNote.description;
    var result = await db.insert(TABLE_NAME, map, conflictAlgorithm: ConflictAlgorithm.replace);
    return result;
  }

  Future<List<Note>> getAllNote() async {
    Database db = await open();
    List<Map<String, dynamic>> results = await db.query('$TABLE_NAME');
    List<Note> notes = [];
    for (Map<String, dynamic> result in results) {
      notes.add(getNoteFromRaw(result));
    }
    return notes;
  }

  Note getNoteFromRaw(Map<String, dynamic> result) {
    return Note(result["id"], result["description"]);
  }



}
