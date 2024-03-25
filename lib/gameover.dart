import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Gameover extends StatelessWidget {
  bool gamehasover;

  Gameover({required this.gamehasover});

  @override
  Widget build(BuildContext context) {
    return gamehasover
        ? Stack(children: [
            Container(
              alignment: Alignment(0, -0.7),
              child: Text(
                'Game over',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
              ),
            )
          ])
        : Container();
  }
}
