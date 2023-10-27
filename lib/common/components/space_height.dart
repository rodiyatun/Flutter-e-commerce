import 'package:flutter/material.dart';
class SpaceHeight extends StatelessWidget {
  final double height;
  const SpaceHeight(this.height,{super.key});

  @override
  Widget build(BuildContext context) => SizedBox(height: height);
  }
