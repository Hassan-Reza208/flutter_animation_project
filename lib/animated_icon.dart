
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedIconPage extends StatefulWidget {
  @override
  _AnimatedIconPageState createState() => _AnimatedIconPageState();
}

class _AnimatedIconPageState extends State<AnimatedIconPage> with TickerProviderStateMixin{
  AnimationController controller;
  bool isPlaying = false;

  // @override
  // void initState() {
  //   controller = AnimationController(duration: Duration(milliseconds: 2000), vsync: this);
  //   controller.forward().then((_) async{
  //     await Future.delayed(Duration(seconds: 1));
  //     controller.reverse();
  //   });
  //   super.initState();
  // }

  @override
  void initState() {
   controller = AnimationController(duration: Duration(milliseconds: 1500), vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>Scaffold(
    appBar: AppBar(
      title: Text('Animated icon'),
      centerTitle: true,
    ),
    body: Center(
      child: IconButton(
        iconSize: 150,
        onPressed: toggleIcon,
        splashColor: Colors.greenAccent

        ,
        icon: AnimatedIcon(
          icon: AnimatedIcons.play_pause,
          color: Colors.lightBlueAccent,
          progress: controller,
        ),
      ),
    ),
  );

  void toggleIcon() => setState((){
    isPlaying = !isPlaying;
    isPlaying ? controller.forward() : controller.reverse();
  });
}
