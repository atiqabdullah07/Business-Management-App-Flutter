import 'package:flutter/material.dart';

class GradientIcon extends StatelessWidget {
  final double iconSize;
  final iconData;

  const GradientIcon({Key? key, required this.iconSize, required this.iconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect) => const LinearGradient(
        colors: [
          Color(0xff192C62),
          Color(0xffE11941),
        ],
        begin: Alignment.centerLeft,
      ).createShader(rect),
      child: Icon(
        iconData,
        color: Colors.white,
        size: iconSize,
      ),
    );
  }
}

class Gradient {
  static LinearGradient linearGradient = const LinearGradient(
    colors: <Color>[Color(0xff192C62), Color(0xffE11941)],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );
}
