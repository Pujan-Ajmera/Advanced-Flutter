import 'package:get/get.dart';
import '../../utils/import_export.dart';
class DBController extends GetxController {
  final DBService dbService = Get.find<DBService>();
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

  Future<void> fetchConcepts(int category_id) async {
    final db = await dbService.database;
    final data = await db.query('Concepts', where: 'category_id = ?', whereArgs: [category_id]);
    concepts.value = data.map((e) => Concept.fromMap(e)).toList();
  }
}
