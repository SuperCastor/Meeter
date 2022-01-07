import 'package:app/Widgets/meeter_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:app/Widgets/swipeable_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const MeeterBar(),
      body: Center(
        child: Column(
          children: [
            Stack(children: [
              Positioned(
                  top: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: PreferredSize(
                      preferredSize: Size.fromHeight(
                          MediaQuery.of(context).size.height * .05),
                      child: AppBar(
                        title: Row(children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    transitionsBuilder: (context, animation,
                                        secondaryAnimation, child) {
                                      return AlignTransition(
                                        alignment: Alignment.topCenter,
                                        scale: Tween<double>(begin: 0.1, end: 1)
                                            .animate(
                                          CurvedAnimation(
                                            parent: animation,
                                            curve: Curves.bounceIn,
                                          ),
                                        ),
                                        child: child,
                                      );
                                    },
                                    pageBuilder: (BuildContext context,
                                        Animation<double> animation,
                                        Animation<double> secondaryAnimation) {
                                      return Scaffold(
                                        body: Column(children: [
                                          Center(child: Text("Profile"))
                                        ]),
                                      );
                                    },
                                  ));
                            },
                            child: const CircleAvatar(
                              radius: 15,
                              foregroundImage:
                                  AssetImage("assets/valentin.png"),
                            ),
                          )
                        ]),
                        backgroundColor: Colors.white,
                        elevation: 0,
                      ))),
              Column(children: [
                Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * .1)),
                Stack(children: const [
                  SwipeCard(
                      age: 21,
                      name: "Eric",
                      imageURL: "assets/Eric.png",
                      description: "Allons boire un verre !"),
                  SwipeCard(
                    description: "Je ne dis pas non à une expo, ou un cinéma",
                    age: 22,
                    name: "Pablo",
                    imageURL: "assets/Pablo.png",
                  ),
                  SwipeCard(
                    description: "Ma maman dit que je suis le plus beau",
                    age: 22,
                    name: "Quentin",
                    imageURL: "assets/Quentin.png",
                  ),
                  SwipeCard(
                    description: "Un flow de déesse grecque",
                    age: 22,
                    name: "Rita",
                    imageURL: "assets/Rita.png",
                  ),
                  SwipeCard(
                    age: 21,
                    name: "Vik",
                    imageURL: "assets/Vik.png",
                    description:
                        "Je m'appelle Victoria, mais tu peux m'appeler quand tu veux ;)",
                  ),
                ])
              ]),
            ]),
          ],
        ),
      ),
    );
  }
}
