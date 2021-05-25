// import 'package:flutter/material.dart';
// import 'package:flutter/animation.dart';
//
// class ScaleTransitionExample extends StatefulWidget {
//   _ScaleTransitionExampleState createState() => _ScaleTransitionExampleState();
// }
//
// class _ScaleTransitionExampleState extends State<ScaleTransitionExample> with TickerProviderStateMixin {
//
//   AnimationController _controller;
//   Animation<double> _animation;
//
//   initState() {
//     super.initState();
//     _controller = AnimationController(
//         duration: const Duration(milliseconds: 2000), vsync: this, value: 0.1);
//     _animation = CurvedAnimation(parent: _controller, curve: Curves.bounceInOut);
//
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
//
//     return Container(
//         color: Colors.white,
//         child: ScaleTransition(
//             scale: _animation,
//             alignment: Alignment.center,
//             child: Image.asset('assets/card.png', height: 200, width: 200,),
//         )
//     );
//   }
//
// }

// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';
//
// class StaggeredAnimationReplication extends StatefulWidget {
//   @override
//   _StaggeredAnimationReplicationState createState() => new _StaggeredAnimationReplicationState();
// }
//
// class _StaggeredAnimationReplicationState extends State<StaggeredAnimationReplication> with SingleTickerProviderStateMixin{
//
//    AnimationController controller;
//    SequenceAnimation sequenceAnimation;
//
//   @override
//   void initState() {
//     super.initState();
//     controller = new AnimationController(vsync: this);
//
//     sequenceAnimation = new SequenceAnimationBuilder()
//         .addAnimatable(
//         animatable: new Tween<double>(begin: 0.0, end: 1.0),
//         from: Duration.zero,
//         to: const Duration(milliseconds: 200),
//         curve: Curves.ease,
//         tag: "opacity"
//     ).addAnimatable(
//         animatable: new Tween<double>(begin: 50.0, end: 150.0),
//         from: const Duration(milliseconds: 250),
//         to: const Duration(milliseconds: 500),
//         curve: Curves.ease,
//         tag: "width"
//     ).addAnimatable(
//         animatable: new Tween<double>(begin: 50.0, end: 150.0),
//         from: const Duration(milliseconds: 500),
//         to: const Duration(milliseconds: 750),
//         curve: Curves.ease,
//         tag: "height"
//     ).addAnimatable(
//         animatable: new EdgeInsetsTween(begin: const EdgeInsets.only(bottom: 32.0), end: const EdgeInsets.only(bottom: 75.0),),
//         from: const Duration(milliseconds: 500),
//         to: const Duration(milliseconds: 750),
//         curve: Curves.ease,
//         tag: "padding"
//     ).addAnimatable(
//         animatable: new BorderRadiusTween(begin: new BorderRadius.circular(4.0), end: new BorderRadius.circular(75.0),),
//         from: const Duration(milliseconds: 750),
//         to: const Duration(milliseconds: 1000),
//         curve: Curves.ease,
//         tag: "borderRadius"
//     ).addAnimatable(
//         animatable: new ColorTween(begin: Colors.indigo[100], end: Colors.orange[400],),
//         from: const Duration(milliseconds: 1000),
//         to: const Duration(milliseconds: 1500),
//         curve: Curves.ease,
//         tag: "color"
//     ).animate(controller);
//   }
//
//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }
//
//   Widget _buildAnimation(BuildContext context, child) {
//     return new Container(
//       padding: sequenceAnimation["padding"].value,
//       alignment: Alignment.bottomCenter,
//       child: new Container(
//         width: sequenceAnimation["width"].value,
//         height: sequenceAnimation["height"].value,
//         decoration: new BoxDecoration(
//           color: sequenceAnimation["color"].value,
//           border: new Border.all(
//             color: Colors.indigo[300],
//             width: 3.0,
//           ),
//           borderRadius: sequenceAnimation["borderRadius"].value,
//         ),
//       ),
//     );
//   }
//
//   Future<Null> _playAnimation() async {
//     try {
//       await controller.forward().orCancel;
//       await controller.reverse().orCancel;
//     } on TickerCanceled {
//       // the animation got canceled, probably because we were disposed
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar: new AppBar(
//         title: new Text("Staggered Animation"),
//       ),
//       body: new GestureDetector(
//         behavior: HitTestBehavior.opaque,
//         onTap: () {
//           _playAnimation();
//         },
//         child: new Center(
//           child: new Container(
//             width: 300.0,
//             height: 300.0,
//             decoration: new BoxDecoration(
//               color: Colors.black.withOpacity(0.1),
//               border: new Border.all(
//                 color: Colors.black.withOpacity(0.5),
//               ),
//             ),
//             child: new AnimatedBuilder(
//                 animation: controller,
//                 builder: _buildAnimation
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class MyAnimation extends StatefulWidget {
//   @override
//   _MyAnimationState createState() => _MyAnimationState();
// }
//
// class _MyAnimationState extends State<MyAnimation>
//     with TickerProviderStateMixin {
//   AnimationController controller;
//   Animation<double> animation;
//
//   @override
//   void initState() {
//     controller =
//         AnimationController(duration: Duration(seconds: 3), vsync: this);
//     animation = Tween<double>(begin: 0, end: 255).animate(controller)
//       ..addListener(() {
//         setState(() {});
//       });
//
//     animation.addStatusListener((status) {
//       if (status == AnimationStatus.completed) {
//         controller.reverse();
//       } else if (status == AnimationStatus.dismissed) {
//         controller.forward();
//       }
//     });
//     animation.addStatusListener((status) {
//       print('$status');
//     });
//
//
//     controller.forward();
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
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//         appBar: AppBar(),
//         body: Center(
//           child: Container(
//             margin: EdgeInsets.symmetric(vertical: 10),
//             height: animation.value,
//             width: animation.value,
//             child: FlutterLogo(),
//           ),
//         ),
//       );
//   }
// }

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class ComplexAnimation extends StatefulWidget {
//   @override
//   _ComplexAnimationState createState() => _ComplexAnimationState();
// }
//
// class _ComplexAnimationState extends State<ComplexAnimation>
//     with TickerProviderStateMixin {
//   Animation<double> animation;
//   AnimationController controller;
//
//   @override
//   void initState() {
//     controller = AnimationController(
//         duration: Duration(milliseconds: 2000), vsync: this);
//     animation = CurvedAnimation(parent: controller, curve: Curves.bounceInOut)
//       ..addStatusListener((status) {
//         if (status == AnimationStatus.completed) {
//           controller.reverse();
//         } else if (status == AnimationStatus.dismissed) {
//           controller.forward();
//         }
//       });
//
//     controller.forward();
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     controller.dispose();
//     // TODO: implement dispose
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) => AnimatedLogo(animation: animation);
// }
//
// class AnimatedLogo extends AnimatedWidget {
//   AnimatedLogo({key, Animation<double> animation}): super(key: key, listenable: animation);
//
//   static final _opacityTween = Tween<double>(begin: 0.1, end: 1);
//   static final _sizeTween = Tween<double>(begin: 0, end: 300);
//
//   @override
//   Widget build(BuildContext context) {
//     final animation = listenable as Animation<double>;
//     return Center(
//       child: Opacity(
//         opacity: _opacityTween.evaluate(animation),
//         child: Container(
//           margin: EdgeInsets.symmetric(vertical: 10),
//           height: _sizeTween.evaluate(animation),
//           width: _sizeTween.evaluate(animation),
//           child: FlutterLogo(),
//         ),
//       ),
//     );
//   }
// }


// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class SizedTransition extends StatefulWidget {
//   @override
//   _SizedTransitionState createState() => _SizedTransitionState();
// }
//
// class _SizedTransitionState extends State<SizedTransition> with TickerProviderStateMixin {
//   Animation<double> animation;
//   AnimationController controller;
//
//   @override
//   void initState() {
//     controller = AnimationController(duration: Duration(milliseconds: 1000), vsync: this);
//     animation = CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);
//     controller.forward();
//     animation.addStatusListener((status) {
//       if(status == AnimationStatus.completed) {
//         controller.reverse();
//       } else if(status == AnimationStatus.dismissed) {
//         controller.forward();
//       }
//     });
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
//     body: SizeTransition(
//       sizeFactor: animation,
//       axis: Axis.horizontal,
//       axisAlignment: -1,
//       child: Center(child: Container(
//           padding: EdgeInsets.all(20),
//           child: FlutterLogo(size: 200.0,))),
//     ),
//   );
// }
//



// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class FadeTransition1 extends StatefulWidget {
//   @override
//   _FadeTransition1State createState() => _FadeTransition1State();
// }
//
// class _FadeTransition1State extends State<FadeTransition1> {
//   bool _visible = true;
//   @override
//   Widget build(BuildContext context) => Scaffold(
//     appBar: AppBar(
//       leading: Icon(Icons.menu),
//       title: Text('Fade Transition'),
//       actions: [
//         Icon(Icons.account_circle_outlined),
//         SizedBox(width: 10,)
//       ],
//     ),
//
//     body: Center(
//       child: AnimatedOpacity(
//         opacity: _visible ? 1.0 : 0.0,
//         duration: Duration(milliseconds: 500),
//         child: Container(
//           width: 200.0,
//           height: 200,
//           color: Colors.green,
//         ),
//       ),
//     ),
//     floatingActionButton: FloatingActionButton(
//       child: Icon(Icons.flip),
//       onPressed: (){
//         setState(() {
//           _visible = !_visible;
//         });
//       },
//     ),
//
//   );
// }


import 'package:flutter/material.dart';

import 'package:flip_card/flip_card.dart';




class HomePage2 extends StatelessWidget {
  _renderBg() {
    return Container(
      decoration: BoxDecoration(color: const Color(0xFFFFFFFF)),
    );
  }

  _renderAppBar(context) {
    return MediaQuery.removePadding(
      context: context,
      removeBottom: true,
      child: AppBar(
        brightness: Brightness.dark,
        elevation: 0.0,
        backgroundColor: Color(0x00FFFFFF),
      ),
    );
  }

  _renderContent(context) {
    return Card(
      elevation: 0.0,
      margin: EdgeInsets.only(left: 32.0, right: 32.0, top: 20.0, bottom: 0.0),
      color: Color(0x00000000),
      child: FlipCard(
        direction: FlipDirection.HORIZONTAL,
        speed: 1000,
        onFlipDone: (status) {
          print(status);
        },
        front: Container(
          decoration: BoxDecoration(
            color: Color(0xFF006666),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Front', style: Theme.of(context).textTheme.headline1),
              Text('Click here to flip back',
                  style: Theme.of(context).textTheme.bodyText1),
            ],
          ),
        ),
        back: Container(
          decoration: BoxDecoration(
            color: Color(0xFF006666),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Back', style: Theme.of(context).textTheme.headline1),
              Text('Click here to flip front',
                  style: Theme.of(context).textTheme.bodyText1),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FlipCard'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          _renderBg(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _renderAppBar(context),
              Expanded(
                flex: 4,
                child: _renderContent(context),
              ),
              Expanded(
                flex: 1,
                child: Container(),
              ),
            ],
          )
        ],
      ),
    );
  }
}
