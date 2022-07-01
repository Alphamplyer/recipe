
import 'package:flutter/material.dart';
import 'package:frontend/src/shared/const.dart';

class ElevatedIconButton extends StatelessWidget {
  final Color? color;
  final IconData icon;
  final Function()? onPressed;
  final double? size;
  

  const ElevatedIconButton({
    Key? key, 
    this.color, 
    required this.icon, 
    this.onPressed, 
    this.size
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.hardEdge,
      borderRadius: BorderRadius.circular(kSpace),
      child: Ink(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: color ?? Theme.of(context).primaryColor,
        ),
        child: IconButton(
          icon: Icon(icon),
          onPressed: onPressed
        ),
      ),
    );
  }
}