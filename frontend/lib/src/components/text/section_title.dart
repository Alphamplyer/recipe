
import 'package:flutter/material.dart';
import 'package:frontend/src/shared/const.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kSpace * 2),
      child: Text(
        title, 
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }
}