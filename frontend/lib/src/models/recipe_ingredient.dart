
import 'package:frontend/src/models/ingredient.dart';

class RecipeIngredient {
  final Ingredient ingredient;
  final String quantity;

  RecipeIngredient({
    required this.ingredient,
    required this.quantity,
  });

  factory RecipeIngredient.fromJson(Map<String, dynamic> json) {
    return RecipeIngredient(
      ingredient: Ingredient.fromJson(json['ingredient']),
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ingredient': ingredient.toJson(),
      'quantity': quantity,
    };
  }
}