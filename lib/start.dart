import 'package:flutter/material.dart';

class Start extends StatelessWidget {
  final bool gamehasstarted;
  Start({required this.gamehasstarted});

  @override
  Widget build(BuildContext context) {
    return gamehasstarted
        ? Container()
        : Stack(
            children: [
              Container(
                alignment: Alignment(0, 0),
                child: Image.asset(
                  'assets/start_game.png',
                  width: 5000,
                  height: 5000,
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Container(
                alignment: Alignment(0, -0.7),
                child: Text(
                  'Runner',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 60,
                      fontWeight: FontWeight.w700),
                ),
              )
            ],
          );
  }
}
