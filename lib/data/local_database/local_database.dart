import 'package:ploff/data/local_database/cached_meals.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class LocalDataBase {
  static final LocalDataBase getInstance = LocalDataBase._();

  factory LocalDataBase() => getInstance;

  LocalDataBase._();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initDB("meals.db");
      return _database!;
    }
  }

  Future<Database> _initDB(String filePath) async {
    var db = await getDatabasesPath();
    var pathes = join(db, filePath);
    return await openDatabase(
      pathes,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    const String idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
    const String textType = "TEXT NOT NULL";
    const String intType = "INTEGER DEFAULT 0";
    const String doubleType = "REAL DEFAULT 0";
    const String boolType = 'BOOLEAN NOT NULL';

    db.execute("""
    CREATE TABLE $tableName (
      ${CachedMealsFields.id} $idType,
      ${CachedMealsFields.nameMeal} $textType,
      ${CachedMealsFields.mealDescription} $textType,
      ${CachedMealsFields.priceMeal} $doubleType,
      ${CachedMealsFields.typeMeal} $intType
    )
""");
  }

  static Future<CachedMeals> insertMeals(CachedMeals cachedMeals) async {
    final db = await getInstance.database;
    final id = await db.insert(tableName, cachedMeals.toJson());
    return cachedMeals.copyWith(id: id);
  }

  static Future<List<CachedMeals>> getAllCachedMeals() async {
    final db = await getInstance.database;
    final result = await db.query(tableName);
    return result.map((json) => CachedMeals.fromJson(json)).toList();
  }

  static Future<int> deleteCachedMeals(int id) async {
    final db = await getInstance.database;
    var t = await db
        .delete(tableName, where: "${CachedMealsFields.id}=?", whereArgs: [id]);
    if (t > 0) {
      return t;
    } else {
      return -1;
    }
  }

  static Future<int> deleteAllCachedMeals() async {
    final db = await getInstance.database;
    return await db.delete(tableName);
  }
}
