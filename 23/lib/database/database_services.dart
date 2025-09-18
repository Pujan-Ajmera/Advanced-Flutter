// import 'dart:typed_data' show ByteData;
// import '../utils/import_export.dart';
// class MyDatabase {
//   static final MyDatabase _instance = MyDatabase._internal();
//   static Database? _database;
//
//   MyDatabase._internal();
//
//   factory MyDatabase() => _instance;
//
//   Future<Database> get database async {
//     if (_database != null) return _database!;
//     _database = await _initDatabase();
//     return _database!;
//   }
//
//   Future<Database> _initDatabase() async {
//     Directory documentsDirectory = await getApplicationDocumentsDirectory();
//     String path = join(documentsDirectory.path, 'my_app.db');
//     if (!await File(path).exists()) {
//       ByteData data = await rootBundle.load('assets/my_app.db');
//       List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
//       await File(path).writeAsBytes(bytes);
//     }
//
//     final db = await openDatabase(path, readOnly: true);
//     await db.execute('PRAGMA foreign_keys = ON');
//     return db;
//   }
//   Future<List<Map<String, dynamic>>> getAllCategories() async {
//     final db = await database;
//     return await db.query('Category');
//   }
//
//   Future<List<Map<String, dynamic>>> getConceptsByCategory(int categoryId) async {
//     final db = await database;
//     return await db.query('Concepts', where: 'categoryId = ?', whereArgs: [categoryId]);
//   }
// }
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class MyDatabase {
  static final MyDatabase _instance = MyDatabase._internal();
  static Database? _database;

  MyDatabase._internal();

  factory MyDatabase() => _instance;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'my_app.db');

    // Copy from assets only if the file doesn't exist
    if (!await File(path).exists()) {
      ByteData data = await rootBundle.load('assets/my_app.db');
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes);
    }

    final db = await openDatabase(path, readOnly: true);
    await db.execute('PRAGMA foreign_keys = ON');
    return db;
  }

  Future<List<Map<String, dynamic>>> getAllCategories() async {
    final db = await database;
    return await db.query('Category');
  }

  Future<List<Map<String, dynamic>>> getConceptsByCategory(int categoryId) async {
    final db = await database;
    return await db.query('Concepts', where: 'categoryId = ?', whereArgs: [categoryId]);
  }
}
