import 'package:animations/slide_transition/data.dart';
import 'package:animations/slide_transition/model/chat.dart';
import 'package:animations/slide_transition/utils.dart';
import 'package:animations/slide_transition/widget/slidable_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage4 extends StatefulWidget {
  @override
  _HomePage4State createState() => _HomePage4State();
}

class _HomePage4State extends State<HomePage4> {
  final List items = List.of(Data.chats);

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.greenAccent,
        appBar: AppBar(
          title: Text('Animated ListView'),
          elevation: 0,
        ),
        body: ListView.separated(
          padding: EdgeInsets.all(12),
          itemCount: items.length,
          separatorBuilder: (context, index) => Divider(),
          itemBuilder: (context, index) {
            final item = items[index];
            return SlidableWidget(
                child: buildListTile(item),
                background: background(),
                onSlided: () {
              setState(() {
                item.isFavourite = !item.isFavourite;
              });

              Utils.showSnackBar(context,
                  'You have ${item.isFavourite ? 'LIKED' : 'UNLIKED'} your chat partner.');
            },);
          },
        ),
      );

  Widget buildListTile(Chat item) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          leading: Stack(
            overflow: Overflow.visible,
            children: [
              CircleAvatar(
                radius: 28,
                backgroundImage: NetworkImage(item.urlAvatar),
              ),
              if (item.isFavourite)
                Positioned(
                  child: buildHeart(),
                  left: -4,
                  top: -6,
                ),
            ],
            
          ),
        ),
      );

 Widget buildHeart() => Container(
   decoration: BoxDecoration(
     shape: BoxShape.circle,
     color: Colors.white,
     border: Border.all(width: 2, color: Colors.red),
   ),
   padding: EdgeInsets.all(2),
   child: Icon(Icons.favorite, color: Colors.red, size: 16),
   
 );

  background() {}

  onSlided() {}
}
