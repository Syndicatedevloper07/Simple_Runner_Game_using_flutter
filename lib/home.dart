import 'dart:async';

import 'package:firstgame/baricade.dart';
import 'package:firstgame/gameover.dart';
import 'package:firstgame/man.dart';
import 'package:firstgame/score.dart';
import 'package:firstgame/start.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int score = 0;
  int bestscore = 0;
  bool gamehasStarted = false;
  bool gameover = false;
  bool jump = false;
  bool manjumpsoverbarricade = false;

  double gravity = 9.8;
  double height = 0;
  double time = 0;
  double velocity = 5;

  double manx = -0.5;
  double many = 1;
  double manwidth = 0.2;
  double manheight = 0.4;

  double barricadex = 0.5;
  double barricadey = 1;
  double barricadewidth = 0.2;
  double barricadeheight = 0.4;

  void startgame() {
    setState(() {
      gamehasStarted = true;
    });
    Timer.periodic(Duration(milliseconds: 10), (timer) {
      if (detectCollision()) {
        gameover = true;
        timer.cancel();
        setState(() {
          if (score > bestscore) {
            bestscore = score;
          }
        });
      }
      loopforbarricade();
      updateforscore();
      setState(() {
        barricadex -= 0.01;
      });
    });
  }

  void updateforscore() {
    if (barricadex < manx && manjumpsoverbarricade == false) {
      setState(() {
        manjumpsoverbarricade = true;
        score++;
      });
    }
  }

  void loopforbarricade() {
    setState(() {
      if (barricadex <= -1.2) {
        barricadex = 1.2;
        manjumpsoverbarricade = false;
      }
    });
  }

  bool detectCollision() {
    if (barricadex <= manx + manwidth &&
        barricadex + barricadewidth >= manx &&
        many >= barricadey - barricadeheight) {
      return true;
    }
    return false;
  }

  void jumpman() {
    jump = true;
    Timer.periodic(Duration(milliseconds: 10), (timer) {
      height = -gravity / 2 * time * time + velocity * time;

      setState(() {
        if (1 - height > 1) {
          resetJump();
          many = 1;
          timer.cancel();
        } else {
          many = 1 - height;
        }
      });
      if (gameover) {
        timer.cancel();
      }
      time += 0.01;
    });
  }

  void resetJump() {
    jump = false;
    time = 0;
  }

  void playagain() {
    setState(() {
      gameover = false;
      gamehasStarted = false;
      barricadex = 1.2;
      score = 0;
      many = 1;
      jump = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: gameover
          ? (playagain)
          : (gamehasStarted ? (jump ? null : jumpman) : startgame),
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              Expanded(
                  flex: 2,
                  child: Center(
                    child: Center(
                      child: Stack(children: [
                        Start(gamehasstarted: gamehasStarted),
                        Score(
                          score: score,
                          bestscore: bestscore,
                        ),
                        Man(
                            manx: manx,
                            many: many - manheight,
                            manwidth: manwidth,
                            manheight: manheight),
                        Barricade(
                            barricadex: barricadex,
                            barricadey: barricadey,
                            barricadeheight: barricadeheight,
                            barricadewidth: barricadewidth),
                        Gameover(gamehasover: gameover)
                      ]),
                    ),
                  )),
              Expanded(
                  child: Container(
                color: Colors.green[600],
                child: Center(
                  child: Text('Made by Ajith Bhaskaran',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontSize: 25)),
                ),
              ))
            ],
          )),
    );
  }
}
