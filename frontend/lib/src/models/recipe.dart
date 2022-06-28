
import 'package:frontend/src/models/recipe_ingredient.dart';
import 'package:frontend/src/models/recipe_step.dart';
import 'package:frontend/src/models/tool.dart';

class Recipe {
  final int? id;
  final String name;
  final String? description;
  final String imageUrl;
  final List<RecipeIngredient> ingredients;
  final List<Tool> tools;
  final List<RecipeStep> steps;

  Recipe({
    this.id,
    required this.name,
    this.description,
    required this.imageUrl,
    required this.ingredients,
    required this.tools,
    required this.steps,
  });
  
  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      ingredients: (json['ingredients'] as List<dynamic>)
        .map((e) => RecipeIngredient.fromJson(e as Map<String, dynamic>))
        .toList(),
      tools: (json['tools'] as List<dynamic>)
        .map((e) => Tool.fromJson(e))
        .toList(),
      steps: (json['steps'] as List<dynamic>)
        .map((e) => RecipeStep.fromJson(e))
        .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
    };
  }
}