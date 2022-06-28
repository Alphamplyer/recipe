
import 'package:flutter/material.dart';
import 'package:frontend/src/shared/const.dart';

class RecipeDescription extends StatelessWidget {
  final String? content;
  
  const RecipeDescription({
    Key? key,
    required this.content,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    if (content == null) {
      return Container();
    }

    return Padding(
      padding: const EdgeInsets.all(kSpace * 2),
      child: Text(
        content!,
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }
}