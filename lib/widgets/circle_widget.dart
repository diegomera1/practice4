import 'package:flutter/material.dart';

class CircleWidget extends StatelessWidget {
  final double radius;
  final Color color;

  const CircleWidget({
    Key? key,
    required this.radius,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
