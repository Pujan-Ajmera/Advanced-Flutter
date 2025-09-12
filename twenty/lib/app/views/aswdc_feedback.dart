import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/feedback_controller.dart';


class FeedbackPage extends StatelessWidget {
  FeedbackPage({super.key});

  final FeedbackController controller = Get.put(FeedbackController());
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _feedbackController = TextEditingController();
  final TextEditingController _remarksController = TextEditingController();

  String? _validateNotEmpty(String? value, String field) {
    if (value == null || value.trim().isEmpty) return "$field is required";
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) return "Email is required";
    final emailRegex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value.trim())) return "Enter a valid email";
    return null;
  }

  String? _validateMobile(String? value) {
    if (value == null || value.trim().isEmpty) return "Mobile is required";
    if (!RegExp(r'^[0-9]{10}$').hasMatch(value.trim())) {
      return "Enter a valid 10-digit mobile number";
    }
    return null;
  }

  InputDecoration _fieldDecoration(String label) {
    return InputDecoration(
      labelText: label,
      filled: true,
      fillColor: Colors.grey.shade300,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Color darkNavy = const Color(0xFF2C2C54);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Feedback"),
        backgroundColor: darkNavy,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Read-only app info
              Obx(() => TextFormField(
                readOnly: true,
                controller: TextEditingController(
                    text: controller.appName.value),
                decoration: _fieldDecoration("App Name"),
              )),
              const SizedBox(height: 12),
              Obx(() => TextFormField(
                readOnly: true,
                controller: TextEditingController(
                    text: controller.versionNo.value),
                decoration: _fieldDecoration("Version No"),
              )),
              const SizedBox(height: 12),
              Obx(() => TextFormField(
                readOnly: true,
                controller:
                TextEditingController(text: controller.platform.value),
                decoration: _fieldDecoration("Platform"),
              )),
              const SizedBox(height: 20),

              // User input fields
              TextFormField(
                controller: _nameController,
                validator: (v) => _validateNotEmpty(v, "Name"),
                decoration: _fieldDecoration("Name"),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _mobileController,
                validator: _validateMobile,
                keyboardType: TextInputType.phone,
                decoration: _fieldDecoration("Mobile Number"),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _emailController,
                validator: _validateEmail,
                keyboardType: TextInputType.emailAddress,
                decoration: _fieldDecoration("Email"),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _feedbackController,
                validator: (v) => _validateNotEmpty(v, "Feedback"),
                maxLines: 4,
                decoration: _fieldDecoration("Feedback"),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _remarksController,
                maxLines: 2,
                decoration: _fieldDecoration("Remarks (Optional)"),
              ),
              const SizedBox(height: 24),

              // Buttons Row
              Row(
                children: [
                  Expanded(
                    child: Obx(() => ElevatedButton(
                      onPressed: controller.isSubmitting.value
                          ? null
                          : () {
                        if (_formKey.currentState!.validate()) {
                          controller.submitFeedback(
                            personName: _nameController.text.trim(),
                            mobile: _mobileController.text.trim(),
                            email: _emailController.text.trim(),
                            message: _feedbackController.text.trim(),
                            remarks: _remarksController.text.trim(),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: darkNavy,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: controller.isSubmitting.value
                          ? const CircularProgressIndicator(
                          color: Colors.white)
                          : const Text("Send",
                          style: TextStyle(fontSize: 16)),
                    )),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        _formKey.currentState?.reset();
                        _nameController.clear();
                        _mobileController.clear();
                        _emailController.clear();
                        _feedbackController.clear();
                        _remarksController.clear();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: darkNavy,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: const Text("Clear",
                          style: TextStyle(fontSize: 16)),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
