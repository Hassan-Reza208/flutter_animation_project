import 'package:animations/slide_transition/data.dart';
import 'package:animations/slide_transition/model/chat.dart';
import 'package:animations/slide_transition/utils.dart';
import 'package:animations/slide_transition/widget/slidable_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage3 extends StatefulWidget {
  @override
  _HomePage3State createState() => _HomePage3State();
}

class _HomePage3State extends State<HomePage3> {
  final List items = List.of(Data.chats);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.pinkAccent,
        appBar: AppBar(
          title: Text('Slide'),
        ),
        body: ListView.separated(
          padding: EdgeInsets.all(12),
          itemCount: items.length,
          separatorBuilder: (BuildContext context, int index) => Divider(),
          itemBuilder: (context, index) {
            final item = items[index];
            return SlidableWidget(
                child: buildListTile(item),
                background: buildBackground(),
                // onSlided: (){
                //   setState(() {
                //     item.isFavourite = !item.isFavourite;
                //   });
                // },

              onSlided: () {
                setState(() {
                  item.isFavourite = !item.isFavourite;
                });

                Utils.showSnackBar(context,
                    'You have ${item.isFavourite ? 'LIKED' : 'UNLIKED'} your chat partner.');
              },
            );
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
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.username,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                item.message,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          onTap: () {},
        ),
      );

  buildBackground() => Container(
    padding: EdgeInsets.symmetric(horizontal: 12),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      color: Colors.black.withOpacity(0.5)
    ),
    child: Icon(Icons.favorite, color: Colors.white,),
    alignment: Alignment.centerRight,
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
}
