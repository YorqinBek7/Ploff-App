import 'package:ploff/data/local_database/cached_fields.dart';
import 'package:ploff/data/models/products/product.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

const String nameTable = "cart_meals";

class LocalDatabase {
  static final LocalDatabase getInstance = LocalDatabase._init();
  static Database? _database;

  factory LocalDatabase() {
    return getInstance;
  }

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initDB("cartMeals.db");
      return _database!;
    }
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
    const textType = "TEXT NOT NULL";

    await db.execute('''
    CREATE TABLE $nameTable (
    ${CachedMealsFields.id} $idType,
    ${CachedMealsFields.mealDesc} $textType,
    ${CachedMealsFields.mealPrice} $textType,
    ${CachedMealsFields.mealName} $textType
    )
    ''');
  }

  LocalDatabase._init();

  //-------------------------------------------Cached Users Table------------------------------------

  static Future<Product> insertCachedUser(Product cachedUser) async {
    final db = await getInstance.database;
    final id = await db.insert(nameTable, cachedUser.toBase());
    return cachedUser.copyWith(id: id.toString());
  }

  static Future<List<Product>> getAllCachedMeals() async {
    final db = await getInstance.database;
    final result = await db.query(
      nameTable,
    );
    return result.map((json) => Product.fromBase(json)).toList();
  }

  static Future<int> deleteCachedUserById(int id) async {
    final db = await getInstance.database;
    var t = await db.delete(nameTable,
        where: "${CachedMealsFields.id} = ?", whereArgs: [id]);
    if (t > 0) {
      return t;
    } else {
      return -1;
    }
  }

  static Future<int> deleteAllCachedUsers() async {
    final db = await getInstance.database;
    return await db.delete(nameTable);
  }
}
