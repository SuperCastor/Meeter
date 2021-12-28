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
                              print("Open Profile Page");
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
                Stack(children: const [])
              ]),
            ]),
          ],
        ),
      ),
    );
  }
}
