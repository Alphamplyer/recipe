
import 'package:flutter/material.dart';
import 'package:frontend/src/components/edit_recipe/editable_step_form.dart';
import 'package:frontend/src/components/recipe/recipe_step.dart';
import 'package:frontend/src/models/recipe_step.dart';

class EditableStep extends StatefulWidget {
  final RecipeStep step;
  final Function(String)? onSave;
  final Function()? onDelete;

  const EditableStep({Key? key, required this.step, this.onSave, this.onDelete}) : super(key: key);

  @override
  State<EditableStep> createState() => _EditableStepState();
}

class _EditableStepState extends State<EditableStep> {
  late bool _isEditing;

  @override
  void initState() {
    _isEditing = false;
    super.initState();
  }

  void closeEdit() {
    setState(() {
      _isEditing = false;
    });
  }

  void openEdit() {
    FocusManager.instance.primaryFocus?.unfocus();
    setState(() {
      _isEditing = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isEditing 
      ? EditableStepForm(
        step: widget.step,
        onSave: (content) {
          if (content != widget.step.content) {
            widget.onSave?.call(content);
          }

          closeEdit();
        },
        onDelete: () {
          widget.onDelete?.call();
        },
      ) 
      : GestureDetector(
          onTap: openEdit,
          child: RecipeStepView(step: widget.step)
        );
  }
}