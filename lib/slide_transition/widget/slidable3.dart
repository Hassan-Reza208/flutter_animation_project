// import 'dart:html';
//
// import 'package:flutter/cupertino.dart';
//
// class Slidable3 extends StatefulWidget {
//   final Widget child;
//   final Widget background;
//   final double actionThreshold;
//
//   const Slidable3({
//     @required this.child,
//     @required this.background,
//     this.actionThreshold = 0.1,
//     // @required VoidCallback onSlided,
//     Key key,
//   }) : super(key: key);
//
//   @override
//   _Slidable3State createState() => _Slidable3State();
// }
//
// class _Slidable3State extends State<Slidable3> with TickerProviderStateMixin {
//   AnimationController controller;
//
//   @override
//   void initState() {
//     controller = AnimationController(vsync: this);
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
//   Widget build(BuildContext context) => GestureDetector(
//         onHorizontalDragStart: onDragStart,
//         onHorizontalDragUpdate: onDragUpdate,
//         onHorizontalDragEnd: onDragEnd,
//         child: Stack(
//           children: [],
//         ),
//       );
//
//   void onDragStart(DragStartDetails details) {}
//
//   void onDragUpdate(DragUpdateDetails details) {}
//
//   void onDragEnd(DragEndDetails details) {
//     controller.fling(velocity: -1);
//   }
// }
