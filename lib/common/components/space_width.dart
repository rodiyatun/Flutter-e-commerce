import 'package:flutter/material.dart';

class SpaceWidth extends StatelessWidget {
  final double width;
  const SpaceWidth(this.width,{super.key});

  @override
  Widget build(BuildContext context)=> SizedBox(width: width);
  }
