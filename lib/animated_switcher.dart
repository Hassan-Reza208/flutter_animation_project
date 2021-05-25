import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


// class AnimatedSwitcherIconPage extends StatefulWidget {
//   @override
//   _AnimatedSwitcherIconPageState createState() =>
//       _AnimatedSwitcherIconPageState();
// }
//
// class _AnimatedSwitcherIconPageState extends State<AnimatedSwitcherIconPage> {
//   bool flag = false;
//
//   @override
//   Widget build(BuildContext context) => Scaffold(
//     appBar: AppBar(
//
//     ),
//     body: Stack(
//       children: [
//         Image.asset('assets/photo3.jpg', fit: BoxFit.cover),
//         buildPlay(),
//       ],
//     ),
//   );
//
//   Widget buildPlay() => GestureDetector(
//     behavior: HitTestBehavior.opaque,
//     onTap: () => setState(() => flag = !flag),
//     child: AnimatedSwitcher(
//       duration: Duration(milliseconds: 1500),
//       child: flag
//           ? Container(key: Key('1'), color: Colors.red.withOpacity(0.3))
//           : Container(
//         key: Key('2'),
//         color: Colors.blue.withOpacity(0.3),
//         child: Center(
//           child: Icon(
//             Icons.play_arrow,
//             color: Colors.white,
//             size: 100.0,
//           ),
//         ),
//       ),
//     ),
//   );
// }

// class AnimatedSwitcherBasicPage extends StatefulWidget {
//   @override
//   _AnimatedSwitcherBasicPageState createState() =>
//       _AnimatedSwitcherBasicPageState();
// }
//
// class _AnimatedSwitcherBasicPageState extends State<AnimatedSwitcherBasicPage> {
//   bool flag = true;
//
//   @override
//   Widget build(BuildContext context) => Scaffold(
//     appBar: AppBar(),
//     body: Center(
//       child: AnimatedSwitcher(
//         duration: Duration(milliseconds: 1500),
//         child: flag
//             ? Container(
//           key: Key('1'),
//           color: Colors.orange,
//           width: 200,
//           height: 200,
//         )
//             : Container(
//           key: Key('2'),
//           color: Colors.blue,
//           width: 200,
//           height: 200,
//         ),
//       ),
//     ),
//     floatingActionButton: FloatingActionButton(
//       child: Icon(Icons.arrow_forward_ios),
//       onPressed: () => setState(() => flag = !flag),
//     ),
//   );
// }
//



// class AnimatedSwitcherRe extends StatefulWidget {
//   @override
//   _AnimatedSwitcherReState createState() => _AnimatedSwitcherReState();
// }
//
// class _AnimatedSwitcherReState extends State<AnimatedSwitcherRe> {
//   bool flag = true;
//   @override
//   Widget build(BuildContext context) => Scaffold(
//     appBar: AppBar(),
//
//     body: Stack(
//    children: [
//      Positioned(
//        top: 200,
//        left: MediaQuery.of(context).size.width/4,
//        child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJEBSH_doa2Up77ScOk_QG9g4NUbqEObMB1Q&usqp=CAU',
//        fit: BoxFit.cover,),
//      ),
//      GestureDetector(
//        behavior: HitTestBehavior.opaque,
//        onTap: () => setState(() => flag = !flag),
//        child:AnimatedSwitcher(
//          duration: Duration(milliseconds: 1500),
//          child: flag
//              ? Container(key: Key('1'))
//              : Container(
//            key: Key('2'),
//            child: Center(
//              child: Icon(
//                Icons.play_arrow,
//                color: Colors.white,
//                size: 100.0,
//              ),
//            ),
//          ),
//        ),
//      )
//    ],
//     ),
//
//     floatingActionButton: FloatingActionButton(
//       child: Icon(Icons.flip),
//       onPressed: (){
//         setState(() {
//           flag = !flag;
//         });
//       },
//     ),
//   );
// }


class AnimatedSwitcherAdvanced extends StatefulWidget {
  @override
  _AnimatedSwitcherAdvancedState createState() => _AnimatedSwitcherAdvancedState();
}

class _AnimatedSwitcherAdvancedState extends State<AnimatedSwitcherAdvanced> {
  int index = 0;
  final widgets = [
    Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ74IByuSdFet5H83LFxc2ADRO3WR514TmdNQ&usqp=CAU', fit: BoxFit.cover, key: Key('1'),),
    Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTylSQ6Y2HJTGDGvCIqrdgRNiiJdC9SxQi9Ww&usqp=CAU', fit: BoxFit.cover, key: Key('2'),),
    Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjommMgSVDN0Yg15bm4e4qsFh38WUFB_q7ug&usqp=CAU', fit: BoxFit.cover, key: Key('3'),),
  ];
  @override
  Widget build(BuildContext context) => Scaffold(
body: Center(
  child: AnimatedSwitcher(
    duration: Duration(milliseconds: 2000),
    reverseDuration: Duration(milliseconds: 5000),
    // transitionBuilder: (child, animation) => SizeTransition(
    //     child: SizedBox.expand(child: child),
    //     sizeFactor: animation),


    // switchInCurve: Curves.bounceIn,
    // switchOutCurve: Curves.bounceInOut,

    // transitionBuilder: (child, animation) => RotationTransition(
    //     child: SizedBox.expand(child: child),
    //     turns: animation),

    transitionBuilder: (child, animation) => ScaleTransition(
        child: SizedBox.expand(child: child),
        scale: animation),

    // transitionBuilder: (child, animation) => SlideTransition(
    //   position: Tween<Offset>(
    //     begin: const Offset(0.0, 1.0),
    //     end: Offset.zero,
    //   ).animate(animation),
    //     ),

    child: widgets[index],
  ),
),
    floatingActionButton: FloatingActionButton(
      child: Icon(Icons.arrow_forward_ios),
      onPressed: (){
        final isLastIndex = index == widgets.length - 1;

        setState(() => index = isLastIndex ? 0 : index + 1);
      },
    ),
  );
}
