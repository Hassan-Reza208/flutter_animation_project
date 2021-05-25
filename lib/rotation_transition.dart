import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RotationTransitionRev extends StatefulWidget {
  @override
  _RotationTransitionRevState createState() => _RotationTransitionRevState();
}

class _RotationTransitionRevState extends State<RotationTransitionRev>
    with TickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    controller = AnimationController(
        duration: Duration(milliseconds: 2000),
        vsync: this,
        value: 0.25,
        lowerBound: 0.25,
        upperBound: 0.5)..forward();
    animation = CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Center(
      child: RotationTransition(
        turns: animation,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Rotation Transition',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.teal),),
          ],
        ),
      ),
    ),
  );
}
