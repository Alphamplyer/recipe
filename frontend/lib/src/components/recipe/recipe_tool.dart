
import 'package:flutter/material.dart';
import 'package:frontend/src/models/tool.dart';
import 'package:frontend/src/shared/const.dart';

class RecipeTool extends StatelessWidget {
  final Tool tool;

  const RecipeTool({Key? key, required this.tool}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kToolLineHeight,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            key: Key(tool.name),
            tool.imageUrl,
            width: kToolLineHeight,
            height: kToolLineHeight,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, progress) {
              return progress == null
                ? child
                : const SizedBox(
                    height: kToolLineHeight - 2,
                    width: kToolLineHeight - 2,
                    child: Center(child: CircularProgressIndicator())
                  );
            },
          ),
          const SizedBox(width: kSpace),
          Text(
            tool.name,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}