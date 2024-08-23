import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Fondo extends StatelessWidget {
  final boxDecoration = const BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [
        0.2,
        0.8
      ],
          colors: [
        Color.fromRGBO(0, 157, 255, 1),
        Color.fromRGBO(0, 60, 97, 1)
      ]));

  const Fondo({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // gradient
        Container(
          decoration: boxDecoration,
        ),

        // cuadro rosa
        Positioned(top: -100, left: -30, child: _CuadroRosa())
      ],
    );
  }
}

class _CuadroRosa extends StatelessWidget {
  const _CuadroRosa({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -pi / 5,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(80),
            gradient: LinearGradient(colors: [
              Color.fromRGBO(236, 98, 188, 1),
              Color.fromRGBO(241, 142, 172, 1)
            ])),
        height: 360,
        width: 360,
      ),
    );
  }
}
