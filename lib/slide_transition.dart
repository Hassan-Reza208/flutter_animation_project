import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// class SlideTransitionRev extends StatefulWidget {
//   @override
//   _SlideTransitionRevState createState() => _SlideTransitionRevState();
// }
//
// class _SlideTransitionRevState extends State<SlideTransitionRev> with TickerProviderStateMixin{
//   AnimationController controller;
//   Animation<Offset> animation;
//
//   @override
//   void initState() {
//     controller = AnimationController(duration: Duration(milliseconds: 2000),vsync: this)..forward();
//     animation = Tween<Offset>(begin: const Offset(-0.5, 0.0), end: const Offset(0.5, 0.0)).animate(CurvedAnimation(parent: controller, curve: Curves.easeInCubic));
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) => Scaffold(
//     appBar: AppBar(
//       title: Text('Slide Transition'),
//       centerTitle: true,
//     ),
//     body: Center(
//       child: Container(
//         child: SlideTransition(
//           position: animation,
//           textDirection: TextDirection.rtl,
//           child: Text('Slide Transition',
//           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
//         ),
//       ),
//     ),
//
//   );
// }


class SlideTransitionRev extends StatefulWidget {
  @override
  _SlideTransitionRevState createState() => _SlideTransitionRevState();
}

class _SlideTransitionRevState extends State<SlideTransitionRev> with TickerProviderStateMixin{
  AnimationController controller;
  Animation<Offset> animation;

  @override
  void initState() {
    controller = AnimationController(duration: Duration(milliseconds: 2000),vsync: this)..forward()..addStatusListener((status) {
      if(status == AnimationStatus.completed) {
        controller.reverse();
      } else if( status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
    animation = Tween<Offset>(begin: const Offset(-0.5, 0.0), end: const Offset(0.5, 0.0)).animate(CurvedAnimation(parent: controller, curve: Curves.linear));
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('Slide Transition'),
      centerTitle: true,
    ),

    body: Center(
      child: SlideTransition(
        position: animation,
        textDirection: TextDirection.rtl,
        child: Text('Slide Transition',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
      ),
    ),

  );
}
