// lib/controllers/db_controller.dart
import 'package:get/get.dart';
import '../models/category_model.dart';
import '../models/concept_model.dart';
import '../services/db_service.dart';

class DBController extends GetxController {
  final DBService dbService = Get.find<DBService>(); // Use GetX DI
  var categories = <Category>[].obs;
  var concepts = <Concept>[].obs;

  @override
  void onInit() {
    initDB();
    super.onInit();
  }

  Future<void> initDB() async {
    await dbService.initDatabase();
    await fetchCategories();
  }

  Future<void> fetchCategories() async {
    final db = await dbService.database;
    final data = await db.query('Category');
    categories.value = data.map((e) => Category.fromMap(e)).toList();
  }

  Future<void> fetchConcepts(int categoryId) async {
    final db = await dbService.database;
    final data = await db.query('Concepts', where: 'categoryId = ?', whereArgs: [categoryId]);
    concepts.value = data.map((e) => Concept.fromMap(e)).toList();
  }
}
