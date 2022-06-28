
import 'package:flutter/widgets.dart';

class SpacedColumn extends StatelessWidget {
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final TextDirection? textDirection;
  final VerticalDirection verticalDirection;
  final TextBaseline? textBaseline;
  final List<Widget> children;

  final double space;
  
  const SpacedColumn({
    Key? key, 
    required this.space, 
    required this.children, 
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.textBaseline,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> columnChildren = <Widget>[];

    for (final child in children) {
      columnChildren.add(child);
      columnChildren.add(SizedBox(height: space));
    }

    return Column(
      children: columnChildren,
    );
  }
}