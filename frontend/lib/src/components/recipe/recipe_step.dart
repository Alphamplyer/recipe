
import 'package:flutter/material.dart';
import 'package:frontend/src/models/recipe_step.dart';
import 'package:frontend/src/shared/const.dart';

class RecipeStepView extends StatelessWidget {
  final RecipeStep step;

  const RecipeStepView({Key? key, required this.step}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: kSpace),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kSpace * 2, vertical: kSpace * 1.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${step.number}',
              style: Theme.of(context).textTheme.headline5!.copyWith(color: Theme.of(context).colorScheme.secondary),
            ),
            const SizedBox(height: kSpace),
            Text(
              step.content,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      ),
    );
  }
}