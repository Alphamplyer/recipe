
import 'package:flutter/material.dart';
import 'package:frontend/src/components/recipe/recipe_ingredient.dart';
import 'package:frontend/src/models/recipe_ingredient.dart';
import 'package:frontend/src/shared/const.dart';

class RecipeIngredientsView extends StatelessWidget {
  final List<RecipeIngredient> ingredients;

  const RecipeIngredientsView({Key? key, required this.ingredients}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: kSpace),
      child: Padding(
        padding: const EdgeInsets.all(kSpace),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
            ingredients.length, (index) {
              return Padding(
                padding: const EdgeInsets.all(kSpace),
                child: RecipeIngredientView(recipeIngredient: ingredients[index]),
              );
            }
          ),
        ),
      ),
    );
  }
}