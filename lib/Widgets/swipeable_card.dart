import 'package:flutter/material.dart';
import 'package:app/Widgets/gradient_icon.dart';
import 'package:flutter_swipable/flutter_swipable.dart';

class SwipeCard extends StatefulWidget {
  const SwipeCard({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<SwipeCard> createState() => SwipeCardState();
}

class SwipeCardState extends State<SwipeCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * .84,
        width: MediaQuery.of(context).size.width * .98,
        child: Swipable(
            child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Card(
            elevation: 0,
            child: Text(widget.title),
            color: Colors.grey[400],
          ),
        )));
  }
}
