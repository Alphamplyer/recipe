

import 'package:flutter/material.dart';
import 'package:frontend/src/models/recipe_ingredient.dart';
import 'package:frontend/src/shared/const.dart';

class EditableIngredient extends StatelessWidget {
  final RecipeIngredient recipeIngredient;
  final Function()? onDelete;

  const EditableIngredient({Key? key, required this.recipeIngredient, this.onDelete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kIngredientLineHeight,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            key: Key(recipeIngredient.ingredient.name),
            recipeIngredient.ingredient.imageUrl,
            width: kIngredientLineHeight,
            height: kIngredientLineHeight,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, progress) {
              return progress == null
                ? child
                : const SizedBox(
                    height: kIngredientLineHeight - 2,
                    width: kIngredientLineHeight - 2,
                    child: Center(child: CircularProgressIndicator())
                  );
            },
          ),
          const SizedBox(width: kSpace),
          Text(
            recipeIngredient.ingredient.unit == null ? '${recipeIngredient.quantity} ' : '${recipeIngredient.quantity} ${recipeIngredient.ingredient.unit} ',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).colorScheme.secondary),
          ),
          Text(
            recipeIngredient.ingredient.name,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: onDelete,
          ),
        ],
      ),
    );
  }
}