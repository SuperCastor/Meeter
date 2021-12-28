import 'package:flutter/material.dart';
import 'package:app/Widgets/gradient_icon.dart';

class SwipeCard extends StatefulWidget {
  const SwipeCard({Key? key}) : super(key: key);

  @override
  State<SwipeCard> createState() => SwipeCardState();
}

class SwipeCardState extends State<SwipeCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .84,
      width: MediaQuery.of(context).size.width * .98,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Colors.grey[400],
      ),
    );
  }
}
