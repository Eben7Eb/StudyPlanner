// services/auth_service.dart
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
//import '../models/user.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'study_planner.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute(
          'CREATE TABLE users(id INTEGER PRIMARY KEY, username TEXT, password TEXT)',
        );
        db.execute(
          'CREATE TABLE courses(id INTEGER PRIMARY KEY, name TEXT, details TEXT)',
        );
      },
    );
  }
}

class AuthService {
  final DatabaseHelper _dbHelper = DatabaseHelper();

  Future<bool> login(String username, String password) async {
    final db = await _dbHelper.database;
    final List<Map<String, dynamic>> result = await db.query(
      'users',
      where: 'username = ? AND password = ?',
      whereArgs: [username, password],
    );
    return result.isNotEmpty;
  }

  Future<void> signUp(String username, String password) async {
    final db = await _dbHelper.database;
    await db.insert('users', {'username': username, 'password': password});
  }
}
