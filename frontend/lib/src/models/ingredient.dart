
class Ingredient {
  final String name;
  final String imageUrl;
  final String? unit;

  Ingredient({
    required this.name,
    required this.imageUrl,
    this.unit,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      name: json['name'],
      imageUrl: json['imageUrl'],
      unit: json['unit'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'imageUrl': imageUrl,
      'unit': unit,
    };
  }
}