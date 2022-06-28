
import 'package:flutter/material.dart';
import 'package:frontend/src/components/edit_recipe/editable_recipe_name_form.dart';
import 'package:frontend/src/shared/const.dart';

class EditableRecipeHeader extends StatefulWidget {
  final String name;
  final String imageUrl;
  final Function(String)? onSaveName;

  const EditableRecipeHeader({Key? key, required this.name, required this.imageUrl, this.onSaveName}) : super(key: key);

  @override
  State<EditableRecipeHeader> createState() => _EditableRecipeHeaderState();
}

class _EditableRecipeHeaderState extends State<EditableRecipeHeader> {
  late bool _isEditingName;

  @override
  void initState() {
    _isEditingName = false;
    super.initState();
  }
  
  void toggleNameEdit() {
    setState(() {
      _isEditingName = !_isEditingName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.0,
      child: Stack(
        children: [
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: Image.network(
              widget.imageUrl,
              fit: BoxFit.cover,
              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return const Center(child: SizedBox(width: 32.0, height: 32.0, child: CircularProgressIndicator()));
              },
            ),
          ),
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: Container(color: Colors.black26),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {},
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(kSpace * 2),
                child: _isEditingName 
                  ? EditableRecipeNameForm(
                    name: widget.name,
                    onSave: (name) {
                      widget.onSaveName?.call(name);
                      toggleNameEdit();
                    },
                  ) 
                  : GestureDetector(
                    onTap: toggleNameEdit,
                    child: Text(widget.name, style: const TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold))
                  )
              ),
            ],
          ),
        ],
      ),
    );
  }
}