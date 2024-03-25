import 'package:flutter/material.dart';

class Score extends StatelessWidget {
  final bestscore;
  final score;

  Score({this.score, this.bestscore});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'CU: ${score.toString()}',
            style: TextStyle(fontSize: 20),
          ),
          Text('Best: ${bestscore.toString()}', style: TextStyle(fontSize: 20))
        ],
      ),
    );
  }
}
