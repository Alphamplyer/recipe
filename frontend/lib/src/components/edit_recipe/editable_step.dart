
import 'package:flutter/material.dart';
import 'package:frontend/src/components/edit_recipe/editable_step_form.dart';
import 'package:frontend/src/models/recipe_step.dart';
import 'package:frontend/src/shared/const.dart';

class EditableStep extends StatefulWidget {
  final RecipeStep step;
  final Function(String)? onSave;
  final Function()? onDelete;

  const EditableStep({
    Key? key, 
    required this.step, 
    this.onSave, 
    this.onDelete,
  }) : super(key: key);

  @override
  State<EditableStep> createState() => _EditableStepState();
}

class _EditableStepState extends State<EditableStep> {
  late FocusNode focusNode;
  late TextEditingController _contentController;
  late bool _isEdited;

  @override
  void initState() {
    focusNode = FocusNode();
    _contentController = TextEditingController(text: widget.step.content);
    _isEdited = false;
    super.initState();
  }

  void save(String content) {
    if (content != widget.step.content) {
      widget.onSave?.call(content);
    }

    setState(() {
      _isEdited = false;
    });
  }

  void openEditForm() {
    setState(() {
      _isEdited = true;
    });
    focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      key: widget.key,
      canRequestFocus: true,
      descendantsAreFocusable: true,
      onFocusChange: (hasFocus) {
        if (!hasFocus) {
          setState(() {
            _isEdited = false;
          });
        }
      },
      child: _isEdited 
        ? EditableStepForm(
          contentController: _contentController,
          focusNode: focusNode,
          step: widget.step,
          onSave: (content) => save(content),
          onDelete: () => widget.onDelete?.call()
        ) 
        : GestureDetector(
          onTap: openEditForm,
          child: Card(
            margin: const EdgeInsets.only(bottom: kSpace),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kSpace * 2, vertical: kSpace * 1.5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${widget.step.number}',
                        style: Theme.of(context).textTheme.headline5!.copyWith(color: Theme.of(context).colorScheme.secondary),
                      ),
                      Icon(
                        Icons.edit,
                        size: 12.0,
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                    ],
                  ),
                  const SizedBox(height: kSpace),
                  Text(
                    widget.step.content,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
            ),
          )
        )
    );
  }
}