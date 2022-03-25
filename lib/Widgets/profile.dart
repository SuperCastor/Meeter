import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        body: Stack(children: [
      Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
          child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            TextButton(
                onPressed: (() => Navigator.pop(context)),
                child: Text(
                  "X",
                  style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ))
          ])),
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [Text("Hello")],
        ),
      )
    ])));
  }
}
