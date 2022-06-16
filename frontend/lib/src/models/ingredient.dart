
class Ingredient {
  final String name;
  final String imageUrl;

  Ingredient({
    required this.name,
    required this.imageUrl,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      name: json['name'],
      imageUrl: json['imageUrl'],
    );
  }
}