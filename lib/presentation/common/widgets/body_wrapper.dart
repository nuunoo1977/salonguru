import 'package:flutter/material.dart';

class BodyWrapper extends StatelessWidget {
  final Widget child;
  const BodyWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: child,
        ),
      );
}
