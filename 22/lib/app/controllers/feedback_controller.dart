import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:package_info_plus/package_info_plus.dart';

class FeedbackController extends GetxController {
  var appName = "".obs;
  var versionNo = "".obs;
  var platform = "Android".obs;

  var isSubmitting = false.obs;

  @override
  void onInit() {
    super.onInit();
    _loadAppInfo();
  }

  Future<void> _loadAppInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    appName.value = packageInfo.appName;
    versionNo.value = packageInfo.version;
  }

  Future<void> submitFeedback({
    required String personName,
    required String mobile,
    required String email,
    required String message,
    String remarks = "",
  }) async {
    isSubmitting.value = true;

    try {
      var response = await http.post(
        Uri.parse(
            "http://api.aswdc.in/Api/MST_AppVersions/PostAppFeedback/AppPostFeedback"),
        headers: {"Content-Type": "application/x-www-form-urlencoded"},
        body: {
          "AppName": appName.value,
          "VersionNo": versionNo.value,
          "Platform": platform.value,
          "PersonName": personName,
          "Mobile": mobile,
          "Email": email,
          "Message": message,
          "Remarks": remarks,
        },
      );

      if (response.statusCode == 200) {
        Get.snackbar(
          "Success ✅",
          "Feedback submitted successfully",
          snackPosition: SnackPosition.BOTTOM,
        );
        Get.back();
      } else {
        Get.snackbar(
          "Error ",
          "Failed with status: ${response.statusCode}\nBody: ${response.body}",
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 5),
        );
      }
    } catch (e) {
      print(e.toString());
      Get.snackbar(
        "Exception ",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 6),
      );
    } finally {
      isSubmitting.value = false;
    }}
}
