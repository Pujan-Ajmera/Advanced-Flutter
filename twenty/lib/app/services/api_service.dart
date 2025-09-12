import '../../utils/import_export.dart';
import 'package:http/http.dart' as http;
class ApiService {
  static Future<List<Question>> fetchQuestions(String topicName) async {
    final url = Uri.parse('https://66f274a771c84d80587551d2.mockapi.io/movie');
    final res = await http.get(url);

    if (res.statusCode == 200) {
      final List data = json.decode(res.body);
      final topic = data.firstWhere((e) => e['name'] == topicName, orElse: () => null);
      if (topic == null || topic['data'] == null) return [];

      return List<Question>.from(
        topic['data'].map((q) => Question.fromJson(q)),
      );
    } else {
      throw Exception("Failed to fetch data");
    }
  }
}
