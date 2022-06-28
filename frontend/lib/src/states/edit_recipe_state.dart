
import 'package:flutter/widgets.dart';
import 'package:frontend/src/models/recipe.dart';
import 'package:frontend/src/models/recipe_ingredient.dart';
import 'package:frontend/src/models/recipe_step.dart';
import 'package:frontend/src/models/tool.dart';

class EditRecipeState extends ChangeNotifier {
  late String name;
  late String? description;
  late String imageUrl;
  late List<RecipeIngredient> ingredients;
  late List<Tool> tools;
  late List<RecipeStep> steps;

  EditRecipeState({
    required Recipe recipe
  }) {
    name = recipe.name;
    description = recipe.description;
    imageUrl = recipe.imageUrl;
    ingredients = recipe.ingredients;
    tools = recipe.tools;
    steps = recipe.steps;
  }

  void updateName(String name) {
    this.name = name;
    notifyListeners();
  }

  void updateDescription(String description) {
    this.description = description;
    notifyListeners();
  }

  void updateImageUrl(String imageUrl) {
    this.imageUrl = imageUrl;
    notifyListeners();
  }

  void delteIngredient(int index) {
    ingredients.removeAt(index);
    notifyListeners();
  }

  void addIngredient(RecipeIngredient ingredient) {
    ingredients.add(ingredient);
    notifyListeners();
  }

  void deleteTool(int index) {
    tools.removeAt(index);
    notifyListeners();
  }

  void addTool(Tool tool) {
    tools.add(tool);
    notifyListeners();
  }

  void deleteStep(int index) {
    steps.removeAt(index);
    reindexSteps();
    notifyListeners();
  }

  void addStep(String content) {
    steps.add(RecipeStep(number: steps.length + 1, content: content));
    notifyListeners();
  }

  void updateStep(int index, String content) {
    steps[index] = steps[index].copyWith(content: content);
    notifyListeners();
  }

  void reindexSteps() {
    for (int i = 0; i < steps.length; i++) {
      steps[i] = steps[i].copyWith(number: i + 1);
    }
  }
}