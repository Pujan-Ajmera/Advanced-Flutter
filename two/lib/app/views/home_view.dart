import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/db_controller.dart';

class HomeView extends StatelessWidget {
  final DBController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Categories")),
      body: Obx(() {
        if (controller.categories.isEmpty) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: controller.categories.length,
          itemBuilder: (_, index) {
            final category = controller.categories[index];
            return ListTile(
              title: Text(category.name),
              subtitle: Text(category.description),
              onTap: () {
                controller.fetchConcepts(category.id);
                Get.to(() => ConceptView(category.name));
              },
            );
          },
        );
      }),
    );
  }
}

class ConceptView extends StatelessWidget {
  final String categoryName;
  final DBController controller = Get.find();

  ConceptView(this.categoryName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(categoryName)),
      body: Obx(() {
        if (controller.concepts.isEmpty) {
          return Center(child: Text("No concepts found."));
        }
        return ListView.builder(
          itemCount: controller.concepts.length,
          itemBuilder: (_, index) {
            final concept = controller.concepts[index];
            return ListTile(
              title: Text(concept.name),
              trailing: Icon(Icons.abc),
              subtitle: Text(concept.description),
            );
          },
        );
      }),
    );
  }
}
