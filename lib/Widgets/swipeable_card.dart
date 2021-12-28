import 'package:flutter/material.dart';
import 'package:app/Widgets/gradient_icon.dart';
import 'package:flutter_swipable/flutter_swipable.dart';

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
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  elevation: 0,
                  child: Stack(children: [
                    Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: NetworkImage(widget.imageURL),
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
