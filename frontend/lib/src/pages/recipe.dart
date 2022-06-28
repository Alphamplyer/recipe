
import 'package:flutter/material.dart';
import 'package:frontend/src/components/recipe/recipe_description.dart';
import 'package:frontend/src/components/recipe/recipe_header.dart';
import 'package:frontend/src/components/recipe/recipe_ingredients.dart';
import 'package:frontend/src/components/recipe/recipe_step.dart';
import 'package:frontend/src/components/recipe/recipe_tools.dart';
import 'package:frontend/src/components/text/section_title.dart';
import 'package:frontend/src/models/recipe.dart';
import 'package:frontend/src/shared/const.dart';

class RecipePage extends StatelessWidget {
  final Recipe recipe;

  const RecipePage({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          RecipeHeader(
            name: recipe.name,
            imageUrl: recipe.imageUrl,
          ),
          RecipeDescription(
            content: recipe.description,
          ),
          Padding(
            padding: const EdgeInsets.all(kSpace * 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,              
              children: [
                const SectionTitle(title: 'Ingredients'),
                RecipeIngredientsView(
                  ingredients: recipe.ingredients
                ),
                const SectionTitle(title: 'Tools'),
                RecipeTools(tools: recipe.tools),
                const SectionTitle(title: 'Steps'),
                ...List.generate(recipe.steps.length, (int index) {
                  return RecipeStepView(
                    step: recipe.steps[index],
                  );
                })
              ],
            ),
          )
        ],
      )
    );
  }
}