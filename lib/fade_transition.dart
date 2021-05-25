// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class AnimFadeTransition extends StatefulWidget {
//   @override
//   _AnimFadeTransitionState createState() => _AnimFadeTransitionState();
// }
//
// class _AnimFadeTransitionState extends State<AnimFadeTransition>
//     with TickerProviderStateMixin {
//   AnimationController controller;
//   Animation<double> animation;
//
//   @override
//   void initState() {
//     controller =
//         AnimationController(duration: Duration(milliseconds: 5000),
//             vsync: this,
//             value: 0,
//             lowerBound: 0,
//             upperBound: 1
//         );
//     animation =
//         CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);
//     controller.forward();
//     // animation.addStatusListener((status) {
//     //   if (status == AnimationStatus.completed) {
//     //     controller.reverse();
//     //   } else if (status == AnimationStatus.dismissed) {
//     //     controller.forward();
//     //   }
//     // });
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
//     body: Center(
//       child: Container(
//         height: 300,
//         width: 300,
//         child: FadeTransition(
//           opacity: animation,
//           child: Center(
//             child: Text('Woolha.com', style: TextStyle(color: Colors.teal, fontSize: 50)),
//           ),
//         ),
//       ),
//     ),
//   );
// }
//
// //second way
//
// // class OpacityFadeTran extends StatefulWidget {
// //   @override
// //   _OpacityFadeTranState createState() => _OpacityFadeTranState();
// // }
// //
// // class _OpacityFadeTranState extends State<OpacityFadeTran> {
// //   bool _visible = true;
// //   @override
// //   Widget build(BuildContext context) => Scaffold(
// //
// //     body: Center(
// //       child: AnimatedOpacity(
// //         opacity: _visible ? 1.0 : 0.0,
// //         duration: Duration(seconds: 1),
// //         child: Text('Hi to you',
// //         style: TextStyle(fontSize: 22, color: Colors.lightBlueAccent, fontWeight: FontWeight.bold),),
// //       ),
// //     ),
// //     floatingActionButton: FloatingActionButton(
// //       child: Icon(Icons.flip),
// //       onPressed: (){
// //         setState(() {
// //           _visible = !_visible;
// //         });
// //       },
// //     ),
// //   );
// // }

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class FadeTran extends StatefulWidget {
//   FadeTranExampleState createState() => FadeTranExampleState();
// }
//
// class FadeTranExampleState extends State<FadeTran> with TickerProviderStateMixin {
//
//   AnimationController _controller;
//   Animation<double> _animation;
//
//   initState() {
//     super.initState();
//
//     _controller = AnimationController(
//         duration: const Duration(milliseconds: 5000),
//         vsync: this,
//         value: 0,
//         lowerBound: 0,
//         upperBound: 1
//     );
//     _animation = CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn)..addStatusListener((status) {
//       if(status == AnimationStatus.completed) {
//         _controller.reverse();
//       } else if(status == AnimationStatus.dismissed) {
//         _controller.forward();
//       }
//     });
//     _controller.forward();
//   }
//
//   @override
//   dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Woolha.com Flutter Tutorial'),
//       ),
//       body: Center(
//         child: FadeTransition(
//           opacity: _animation,
//           child: Center(
//             child: Text('Woolha.com', style: TextStyle(color: Colors.teal, fontSize: 50)),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FadeTransitionRev extends StatefulWidget {
  @override
  _FadeTransitionRevState createState() => _FadeTransitionRevState();
}

class _FadeTransitionRevState extends State<FadeTransitionRev>
    with TickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    controller =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn)
      ..addListener(() {})
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
    controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool _visible = true;
    return Scaffold(
        body: AnimatedOpacity(
          opacity: _visible ? 1.0 : 0.0,
          duration: Duration(milliseconds: 500),
          child: Text('Fade Transition',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),

        ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.flip),
        onPressed: (){
          setState(() {
            _visible = !_visible;
          });
        },
      ),
      );
  }
}
