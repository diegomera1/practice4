import 'package:flutter/material.dart';

class EmailBoxWidget extends StatelessWidget {
  final bool showBorder;
  final Widget child;

  const EmailBoxWidget({
    Key? key,
    this.showBorder = false,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var boxDecoration;

    if (showBorder) {
      boxDecoration = BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Theme.of(context).primaryColor, width: 1.0),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      decoration: boxDecoration,
      child: child,
    );
  }
}
