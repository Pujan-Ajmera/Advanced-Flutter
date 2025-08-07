import '../../utils/import_export.dart';
class DBService {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    return await initDatabase();
  }

  Future<Database> initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'my_app.db');

    if (!await File(path).exists()) {
      ByteData data = await rootBundle.load('assets/my_app.db');
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes, flush: true);
    }

    _database = await openDatabase(path, readOnly: false);
    return _database!;
  }
}
