
import 'package:flutter/material.dart';
import 'package:frontend/src/components/recipe/recipe_description_form_field.dart';
import 'package:frontend/src/components/recipe/recipe_name_form_field.dart';
import 'package:frontend/src/states/edit_recipe_state.dart';

class EditHeaderDialog extends StatefulWidget {
  final EditRecipeState editRecipeState;

  const EditHeaderDialog({Key? key, required this.editRecipeState}) : super(key: key);

  @override
  State<EditHeaderDialog> createState() => _EditHeaderDialogState();
}

class _EditHeaderDialogState extends State<EditHeaderDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    _nameController = TextEditingController(text: widget.editRecipeState.name);
    _descriptionController = TextEditingController(text: widget.editRecipeState.description);
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Edit Header'),
      content: Form(
        key: _formKey,
        child: Column(children: [
          RecipeNameFormField(controller: _nameController),
          RecipeDescriptionFormField(controller: _descriptionController)
        ]),
      ),
      actions: <Widget>[
        ElevatedButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        ElevatedButton(
          child: Text('Save', style: TextStyle(color: Theme.of(context).colorScheme.secondary)),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              widget.editRecipeState.updateName(_nameController.text);
              Navigator.of(context).pop();
            }
          },
        ),
      ],
    );
  }
}