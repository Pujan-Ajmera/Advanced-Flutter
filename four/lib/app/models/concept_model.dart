class Concept {
  final int id;
  final int categoryId;
  final String name;
  final String description;

  Concept({required this.id, required this.categoryId, required this.name, required this.description});

  factory Concept.fromMap(Map<String, dynamic> map) {
    return Concept(
      id: map['id'],
      categoryId: map['categoryId'],
      name: map['name'],
      description: map['description'],
    );
  }
}
