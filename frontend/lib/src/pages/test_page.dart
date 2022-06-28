
import 'package:flutter/material.dart';
import 'package:frontend/src/components/edit_recipe/editable_step.dart';
import 'package:frontend/src/models/recipe_step.dart';
import 'package:frontend/src/shared/const.dart';

class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Padding(
            padding: const EdgeInsets.all(kSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(kSpace * 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text("Test SquareIconButton", style: Theme.of(context).textTheme.headline6),
                        const SizedBox(height: kSpace),
                        Text("This is a test of the SquareIconButton component. Here you can find a button that can be pressed and long pressed.", style: Theme.of(context).textTheme.bodyText1),
                        const SizedBox(height: kSpace),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Ink(
                              decoration: BoxDecoration(
                                color: Theme.of(context).errorColor,
                                borderRadius: BorderRadius.circular(kSpace),
                              ),
                              child: IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  debugPrint('delete pressed');
                                },
                              ),
                            ),
                            const SizedBox(width: kSpace),
                            Ink(
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(kSpace),
                              ),
                              child: IconButton(
                                icon: const Icon(Icons.done),
                                onPressed: () {
                                  debugPrint('validate pressed');
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: kSpace),
                EditableStep(
                  step: RecipeStep(
                    number: 1,
                    content: "This is a test of the EditableStepForm component. Here you can edit the content of a step.",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}