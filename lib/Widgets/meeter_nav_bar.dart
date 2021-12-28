import 'package:flutter/material.dart';
import 'package:app/Widgets/gradient_icon.dart';

class MeeterBar extends StatefulWidget {
  const MeeterBar({Key? key}) : super(key: key);

  @override
  State<MeeterBar> createState() => MeeterBarState();
}

class MeeterBarState extends State<MeeterBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * .06,
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          iconSize: 20,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedFontSize: 0.0,
          unselectedFontSize: 0.0,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
                activeIcon: GradientIcon(
                    icon: Icons.home,
                    gradient: LinearGradient(colors: [
                      Color.fromARGB(255, 252, 83, 101),
                      Color.fromARGB(255, 255, 120, 84)
                    ]))),
            BottomNavigationBarItem(
                activeIcon: GradientIcon(
                    icon: Icons.grid_3x3,
                    gradient: LinearGradient(colors: [
                      Color.fromARGB(255, 252, 83, 101),
                      Color.fromARGB(255, 255, 120, 84)
                    ])),
                icon: Icon(Icons.grid_3x3),
                label: "Topics"),
            BottomNavigationBarItem(
                activeIcon: GradientIcon(
                    icon: Icons.favorite,
                    gradient: LinearGradient(colors: [
                      Color.fromARGB(255, 252, 83, 101),
                      Color.fromARGB(255, 255, 120, 84)
                    ])),
                icon: Icon(Icons.favorite),
                label: "Match"),
            BottomNavigationBarItem(
                activeIcon: GradientIcon(
                    icon: Icons.message,
                    gradient: LinearGradient(colors: [
                      Color.fromARGB(255, 252, 83, 101),
                      Color.fromARGB(255, 255, 120, 84)
                    ])),
                icon: Icon(Icons.message),
                label: "Messages")
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ));
  }
}
