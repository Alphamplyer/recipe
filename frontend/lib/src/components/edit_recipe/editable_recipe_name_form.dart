
import 'package:flutter/material.dart';
import 'package:frontend/src/components/button/elevated_icon_button.dart';
import 'package:frontend/src/components/edit_recipe/editable_recipe_name_form_field.dart';
import 'package:frontend/src/shared/const.dart';

class EditableRecipeNameForm extends StatefulWidget {
  final String name;
  final Function(String)? onSave;
  final Function()? onCancel;

  const EditableRecipeNameForm({Key? key, required this.name, this.onSave, this.onCancel}) : super(key: key);

  @override
  State<EditableRecipeNameForm> createState() => _EditableRecipeNameFormState();
}

class _EditableRecipeNameFormState extends State<EditableRecipeNameForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;

  @override
  void initState() {
    _nameController = TextEditingController(text: widget.name);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: EditableRecipeNameFormField(controller: _nameController),
          ),
          const SizedBox(width: kSpace),
          ElevatedIconButton(
            color: Theme.of(context).colorScheme.secondary,
            icon: Icons.done,
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                widget.onSave?.call(_nameController.text);
              }
            },
          ),
          const SizedBox(width: kSpace),
          ElevatedIconButton(
            icon: Icons.cancel,
            onPressed: widget.onCancel,
          ),
        ],
      )
    );
  }
}