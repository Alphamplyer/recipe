
import 'package:flutter/material.dart';
import 'package:frontend/src/components/recipe/recipe_tool.dart';
import 'package:frontend/src/models/tool.dart';
import 'package:frontend/src/shared/const.dart';

class RecipeTools extends StatelessWidget {
  final List<Tool> tools;
  
  const RecipeTools({Key? key, required this.tools}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: kSpace),
      child: Padding(
        padding: const EdgeInsets.all(kSpace),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
            tools.length, (index) {
              return Padding(
                padding: const EdgeInsets.all(kSpace),
                child: RecipeTool(tool: tools[index]),
              );
            }
          ),
        ),
      ),
    );
  }
}