
import 'package:flutter/material.dart';
import 'package:frontend/src/components/button/elevated_icon_button.dart';
import 'package:frontend/src/components/recipe/recipe_step_content_form_field.dart';
import 'package:frontend/src/models/recipe_step.dart';
import 'package:frontend/src/shared/const.dart';

class EditableStepForm extends StatefulWidget {
  final RecipeStep step;
  final Function(String)? onSave;
  final Function()? onDelete;
  final TextEditingController? contentController;
  final FocusNode? focusNode;


  const EditableStepForm({
    Key? key, 
    required this.step, 
    this.onSave, 
    this.onDelete,
    this.contentController, 
    this.focusNode
  }) : super(key: key);

  @override
  State<EditableStepForm> createState() => _EditableStepFormState();
}

class _EditableStepFormState extends State<EditableStepForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _contentController;

  @override
  void initState() {
    _contentController = widget.contentController ?? TextEditingController(text: widget.step.content);
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: kSpace),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kSpace * 2, vertical: kSpace * 1.5),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ],
              ),
              const SizedBox(height: kSpace),
              RecipeStepContentFormField(
                controller: _contentController, 
                focusNode: widget.focusNode,
              ),
              const SizedBox(height: kSpace),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedIconButton(
                    color: Theme.of(context).errorColor,
                    icon: Icons.delete, 
                    onPressed: widget.onDelete,
                  ),
                  const SizedBox(width: kSpace),
                  ElevatedIconButton(
                    icon: Icons.done, 
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        widget.onSave?.call(_contentController.text);
                      }
                    },
                  ),
                ],
              ),
            ]
          ),
        ),
      ),
    );
  }
}