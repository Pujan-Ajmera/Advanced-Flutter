import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SQLite Demo',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: CategoryScreen(),
    );
  }
}

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

class CategoryScreen extends StatelessWidget {
  final db = MyDatabase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Categories')),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: db.getAllCategories(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(child: CircularProgressIndicator());

          if (!snapshot.hasData || snapshot.data!.isEmpty)
            return Center(child: Text('No categories found'));

          final categories = snapshot.data!;

          return ListView.builder(
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final cat = categories[index];
              return ListTile(
                title: Text(cat['name']),
                subtitle: Text(cat['description']),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ConceptScreen(categoryId: cat['id'], categoryName: cat['name']),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

class ConceptScreen extends StatelessWidget {
  final int categoryId;
  final String categoryName;
  final db = MyDatabase();

  ConceptScreen({required this.categoryId, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$categoryName Concepts')),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: db.getConceptsByCategory(categoryId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(child: CircularProgressIndicator());

          if (!snapshot.hasData || snapshot.data!.isEmpty)
            return Center(child: Text('No concepts found'));

          final concepts = snapshot.data!;

          return ListView.builder(
            itemCount: concepts.length,
            itemBuilder: (context, index) {
              final concept = concepts[index];
              return ListTile(
                title: Text(concept['name']),
                subtitle: Text(concept['description']),
              );
            },
          );
        },
      ),
    );
  }
}
