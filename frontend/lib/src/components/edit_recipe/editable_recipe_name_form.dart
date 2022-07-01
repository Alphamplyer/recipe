
import 'package:flutter/material.dart';
import 'package:frontend/src/components/button/elevated_icon_button.dart';
import 'package:frontend/src/components/edit_recipe/editable_recipe_name_form_field.dart';
import 'package:frontend/src/shared/const.dart';

class EditableRecipeNameForm extends StatefulWidget {
  final String name;
  final Function(String)? onSave;
  final Function()? onCancel;
  final TextEditingController? nameController;

  const EditableRecipeNameForm({
    Key? key, 
    required this.name, 
    this.onSave, 
    this.onCancel, 
    this.nameController
  }) : super(key: key);

  @override
  State<EditableRecipeNameForm> createState() => _EditableRecipeNameFormState();
}

class _EditableRecipeNameFormState extends State<EditableRecipeNameForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late String _errorMessage;

  @override
  void initState() {
    _errorMessage = '';
    _nameController = widget.nameController ?? TextEditingController(text: widget.name);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];

    if (_errorMessage.isNotEmpty) {
      children.addAll([
        const SizedBox(height: kSpace),
        Text(
         _errorMessage,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Theme.of(context).errorColor),
        )
      ]);
    }
    
    return Form(
      key: _formKey,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(kSpace * 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: EditableRecipeNameFormField(
                      controller: _nameController,
                      onValidate: (value) {
                        if (value == null || value.isEmpty) {
                          setState(() {
                            _errorMessage = 'Name is required';
                          });
                        } else if (value.length < 3) {
                          setState(() {
                            _errorMessage = 'Name must be at least 3 characters';
                          });
                        } else if (value.length > kMaxRecipeNameLength) {
                          setState(() {
                            _errorMessage = 'Name must be less than $kMaxRecipeNameLength characters';
                          });
                        } else {
                          setState(() {
                            _errorMessage = '';
                          });
                        }
                      },
                    ),
                  ),
                  const SizedBox(width: kSpace),
                  ElevatedIconButton(
                    color: Theme.of(context).colorScheme.secondary,
                    icon: Icons.done,
                    size: 60,
                    onPressed: () {
                      print("test1");
                      _formKey.currentState!.validate();
                      print("test2");
                      if (_errorMessage.isEmpty) {
                        print("test");
                        widget.onSave?.call(_nameController.text);
                      }
                    },
                  ),
                  const SizedBox(width: kSpace),
                  ElevatedIconButton(
                    icon: Icons.cancel,
                    size: 60,
                    onPressed: widget.onCancel,
                  ),
                ],
              ),
              ...children
            ],
          ),
        ),
      )
    );
  }
}