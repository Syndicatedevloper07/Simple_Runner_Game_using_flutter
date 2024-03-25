import 'package:flutter/material.dart';

class Man extends StatelessWidget {
  final double manx;
  final double many;
  final double manwidth;
  final double manheight;

  Man({
    required this.manx,
    required this.many,
    required this.manwidth,
    required this.manheight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment((2 * manx + manwidth) / (2 - manwidth),
          (2 * many + manheight) / (2 - manheight)),
      child: Container(
        height: MediaQuery.of(context).size.height * 2 / 3 * manheight / 2,
        width: MediaQuery.of(context).size.width * manwidth / 2,
        child: Image.asset('assets/Man_running.gif'),
      ),
    );
  }
}
