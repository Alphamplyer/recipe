
import 'package:flutter/material.dart';
import 'package:frontend/src/components/button/empty_add_button.dart';
import 'package:frontend/src/components/edit_recipe/editable_ingredients.dart';
import 'package:frontend/src/components/edit_recipe/editable_recipe_header.dart';
import 'package:frontend/src/components/edit_recipe/editable_step.dart';
import 'package:frontend/src/components/recipe/recipe_description.dart';
import 'package:frontend/src/components/recipe/recipe_tools.dart';
import 'package:frontend/src/components/text/section_title.dart';
import 'package:frontend/src/models/recipe.dart';
import 'package:frontend/src/shared/const.dart';
import 'package:frontend/src/states/edit_recipe_state.dart';

class EditRecipePage extends StatefulWidget {
  final Recipe recipe;

  const EditRecipePage({Key? key, required this.recipe}) : super(key: key);

  @override
  State<EditRecipePage> createState() => _EditRecipePageState();
}

class _EditRecipePageState extends State<EditRecipePage> {
  late final EditRecipeState _editRecipeState;

  @override
  void initState() {
    _editRecipeState = EditRecipeState(recipe: widget.recipe);
    _editRecipeState.addListener(onEditRecipeStateChanged);
    super.initState();
  }

  void onEditRecipeStateChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          EditableRecipeHeader(
            name: _editRecipeState.name,
            imageUrl: _editRecipeState.imageUrl,
            onSaveName: (name) => _editRecipeState.updateName(name),
          ),
          RecipeDescription(
            content: _editRecipeState.description,
          ),
          Padding(
            padding: const EdgeInsets.all(kSpace * 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,              
              children: [
                const SectionTitle(title: 'Ingredients'),
                EditableIngredients(
                  ingredients: _editRecipeState.ingredients,
                  onDelete: (index) => _editRecipeState.delteIngredient(index),
                  onAdd: (ingredient) => _editRecipeState.addIngredient(ingredient),
                ),
                const SectionTitle(title: 'Tools'),
                RecipeTools(tools: _editRecipeState.tools),
                const SectionTitle(title: 'Steps'),
                ...List.generate(_editRecipeState.steps.length, (int index) {
                  return EditableStep(
                    step: _editRecipeState.steps[index],
                    onDelete: () => _editRecipeState.deleteStep(index),
                    onSave: (content) => _editRecipeState.updateStep(index, content),
                  );
                }),
                EmptyAddButton(onPressed: () => _editRecipeState.addStep('')),
              ],
            ),
          )
        ],
      )
    );
  }
}