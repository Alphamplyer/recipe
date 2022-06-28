
import 'package:flutter/material.dart';
import 'package:frontend/src/components/edit_recipe/editable_ingredient.dart';
import 'package:frontend/src/models/recipe_ingredient.dart';
import 'package:frontend/src/shared/const.dart';

class EditableIngredients extends StatelessWidget {
  final List<RecipeIngredient> ingredients;
  final Function(int index)? onDelete;
  final Function(RecipeIngredient)? onAdd;

  const EditableIngredients({Key? key, required this.ingredients, this.onDelete, this.onAdd}) : super(key: key);

  void openAddIngredientDialog() {}

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: kSpace),
      child: Padding(
        padding: const EdgeInsets.all(kSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            ...List.generate(
              ingredients.length, (index) {
                return Padding(
                  padding: const EdgeInsets.all(kSpace),
                  child: EditableIngredient(recipeIngredient: ingredients[index], onDelete: () => onDelete?.call(index)),
                );
              }
            ),
            SizedBox(height: ingredients.isNotEmpty ? kSpace : 0),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.all(kSpace)
              ),
              onPressed: openAddIngredientDialog, 
              child: const Icon(Icons.add)
            )
          ]
        ),
      ),
    );
  }
}