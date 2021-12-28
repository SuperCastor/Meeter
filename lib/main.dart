import 'package:app/Widgets/gradient_icon.dart';
import 'package:app/Widgets/meeter_nav_bar.dart';
import 'package:flutter/material.dart';

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
            Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .035)),
            SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .05,
                child: Container(color: Colors.grey)),
            SizedBox(
                width: MediaQuery.of(context).size.width * .95,
                height: MediaQuery.of(context).size.height * .855,
                child: Card(
                  color: Colors.black,
                )),
          ],
        ),
      ),
    );
  }
}
