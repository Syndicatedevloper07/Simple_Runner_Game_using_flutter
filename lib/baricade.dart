import 'package:flutter/material.dart';

class Barricade extends StatelessWidget {
  final double barricadex;
  final double barricadey;
  final double barricadewidth;
  final double barricadeheight;

  Barricade(
      {required this.barricadex,
      required this.barricadey,
      required this.barricadeheight,
      required this.barricadewidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(
          (2 * barricadex + barricadewidth) / (2 - barricadewidth),
          (2 * barricadey + barricadeheight) / (2.5 - barricadeheight)),
      child: Container(
        height:
            MediaQuery.of(context).size.height * 2 / 3 * barricadeheight / 1,
        width: MediaQuery.of(context).size.width * barricadewidth / 2,
        child: Image.asset(
          'assets/barricade-3.png',
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
