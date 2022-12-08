import 'package:ploff/data/local_database/cached_meals.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class LocalDataBase {
  static final LocalDataBase instance = LocalDataBase._();
  factory LocalDataBase() => instance;
  LocalDataBase._();
  static Database? _database;

  Future<void> createDatabase() async {
    var db = await getDatabasesPath();
    var pathes = join(db, "Meals");
    if (_database == null) {
      _database = await openDatabase(
        pathes,
        version: 1,
        onCreate: _onCreate,
      );
    }
  }

  Future<void> _onCreate(Database db, int version) async {
    const String idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
    const String textType = "TEXT NOT NULL";
    const String intType = "INTEGER DEFAULT 0";
    const String boolType = 'BOOLEAN NOT NULL';

    db.execute("""
    CREATE TABLE $tableName (
        
    )
""");
  }
}
