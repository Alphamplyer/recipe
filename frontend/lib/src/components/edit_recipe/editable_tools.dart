
import 'package:flutter/material.dart';
import 'package:frontend/src/components/edit_recipe/editable_tool.dart';
import 'package:frontend/src/models/tool.dart';
import 'package:frontend/src/shared/const.dart';

class EditableTools extends StatelessWidget {
  final List<Tool> tools;
  final Function(int)? onDelete;
  final Function(Tool)? onAdd;
  
  const EditableTools({Key? key, required this.tools, this.onDelete, this.onAdd}) : super(key: key);

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
            ...List.generate(tools.length, (index) {
              return Padding(
                padding: const EdgeInsets.all(kSpace),
                child: EditableTool(
                  tool: tools[index],
                  onDelete: () => onDelete?.call(index),
                ),
              );
            }),
            SizedBox(height: tools.isNotEmpty ? kSpace : 0),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.all(kSpace)
              ),
              onPressed: () {
                // TODO: Add tool
              }, 
              child: const Icon(Icons.add),
            ),
          ]
        ),
      ),
    );
  }
}