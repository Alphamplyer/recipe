
import 'package:flutter/material.dart';
import 'package:frontend/src/shared/const.dart';

class EmptyAddButton extends StatelessWidget {
  final VoidCallback onPressed;

  const EmptyAddButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kMinBlocHeight,
      child: OutlinedButton(
        onPressed: onPressed, 
        child: const Center(child: Icon(Icons.add))
      ),
    );
  }
}