
class Ingredient {
  final int? id;
  final String name;
  final String imageUrl;

  Ingredient({
    this.id,
    required this.name,
    required this.imageUrl,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      id: json['id'],
      name: json['name'],
      imageUrl: json['imageUrl'],
    );
  }
}