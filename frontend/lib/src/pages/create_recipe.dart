
import 'package:flutter/material.dart';
import 'package:frontend/src/components/layout/spaced_column.dart';
import 'package:frontend/src/components/recipe/recipe_description_form_field.dart';
import 'package:frontend/src/components/recipe/recipe_name_form_field.dart';
import 'package:frontend/src/shared/const.dart';

class CreateRecipePage extends StatefulWidget {
  const CreateRecipePage({Key? key}) : super(key: key);

  @override
  State<CreateRecipePage> createState() => _CreateRecipePageState();
}

class _CreateRecipePageState extends State<CreateRecipePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Recipe'),
      ),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(kSpace, kSpace * 2, kSpace, 0),
                      child: SpacedColumn(
                        space: kSpace,
                        children: [
                          RecipeNameFormField(controller: _nameController),
                          RecipeDescriptionFormField(controller: _descriptionController)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(kSpace * 1.5),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // TODO: implement recipe creation
                    }
                  }, 
                  child: const Text('Create'),
                ),
              )
            ],
          )
        ),
      )
    );
  }
}