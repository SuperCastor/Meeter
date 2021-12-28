import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math' as math;
import 'package:app/Widgets/gradient_icon.dart';
import 'package:flutter_swipable/flutter_swipable.dart';

void _onSwipeEnd(Offset position, DragEndDetails details) {}

void _onSwipeLeft(Offset position) {
  print("next " + position.direction.toString());
}

void _onSwipeRight(Offset position) {
  print("it's a match " + position.direction.toString());
}

class SwipeCard extends StatefulWidget {
  const SwipeCard(
      {Key? key,
      required this.name,
      required this.imageURL,
      required this.age,
      required this.description})
      : super(key: key);

  final String description;
  final String name;
  final String imageURL;
  final int age;

  @override
  State<SwipeCard> createState() => SwipeCardState();
}

class SwipeCardState extends State<SwipeCard> {
  StreamController<double> _controller = StreamController<double>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * .84,
        width: MediaQuery.of(context).size.width * .98,
        child: Swipable(
          swipe: _controller.stream,
          onSwipeLeft: _onSwipeLeft,
          onSwipeRight: _onSwipeRight,
          child: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  elevation: 0,
                  child: Stack(children: [
                    Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage(widget.imageURL),
                        fit: BoxFit.fitHeight,
                        alignment: Alignment.center,
                      )),
                    ),
                    Container(
                      height: double.infinity,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          gradient: LinearGradient(
                              begin: FractionalOffset.topCenter,
                              end: FractionalOffset.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Color.fromARGB(180, 0, 0, 0),
                              ],
                              stops: [
                                0,
                                1
                              ])),
                    ),
                    Column(
                      children: [
                        Row(children: [
                          Padding(
                              padding: EdgeInsets.only(
                                  left:
                                      MediaQuery.of(context).size.width * .03)),
                          Text(widget.name,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold)),
                          Text(" " + widget.age.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                              ))
                        ]),
                        Container(
                            width: double.infinity,
                            child: Row(children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width *
                                        .03),
                              ),
                              Flexible(
                                  child: Text(widget.description,
                                      textAlign: TextAlign.start,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ))),
                            ])),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                style: ButtonStyle(
                                  side: MaterialStateProperty.all<BorderSide>(
                                      const BorderSide(
                                          width: 1.0, color: Colors.red)),
                                  shape:
                                      MaterialStateProperty.all<CircleBorder>(
                                          CircleBorder()),
                                ),
                                onPressed: () {
                                  double swipeAngle = math.pi;
                                  _controller.add(swipeAngle);
                                },
                                child:
                                    const Icon(Icons.delete, color: Colors.red),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width *
                                          .15)),
                              TextButton(
                                style: ButtonStyle(
                                  side: MaterialStateProperty.all<BorderSide>(
                                      const BorderSide(
                                          width: 1.0, color: Colors.green)),
                                  shape:
                                      MaterialStateProperty.all<CircleBorder>(
                                          CircleBorder()),
                                ),
                                onPressed: () {
                                  double swipeAngle = math.pi / 4;
                                  _controller.add(swipeAngle);
                                },
                                child: const Icon(Icons.favorite,
                                    color: Colors.green),
                              )
                            ]),
                        Padding(
                            padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).size.height * .02))
                      ],
                      mainAxisAlignment: MainAxisAlignment.end,
                    ),
                  ]))),
        ));
  }
}
