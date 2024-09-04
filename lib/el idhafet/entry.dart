import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:login_fire_baze/el%20idhafet/profil.dart';
import 'profil.dart';
import 'quiz.dart';
import 'quiz1.dart';

// StatefulWidget yomken ta3meli mochkla
class Entry extends StatefulWidget {
  const Entry({super.key});
  @override
  State<Entry> createState() => _EntryState();
}

class _EntryState extends State<Entry> {
  final List _pages = const [
    Profil(),
    Quiz(),
    Quiz1(),
  ];
  int _currentIndex = 0;
  int selectedindex = 0;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageTransitionSwitcher(
        duration: Duration.zero,
        transitionBuilder: (child, animation, secondAnimation) {
          return FadeThroughTransition(
            animation: animation,
            secondaryAnimation: secondAnimation,
            child: child,
          );
        },
        child: _pages[_currentIndex],
      ),
      bottomNavigationBar: Container(
        color: Theme.of(context).brightness == Brightness.light
            ? Colors.white
            : const Color(0xFF101015),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            if (index != _currentIndex) {
              setState(() {
                _currentIndex = index;
              });
            }
          },
          backgroundColor: Theme.of(context).brightness == Brightness.light
              ? Colors.white
              : const Color(0xFF101015),
          type: BottomNavigationBarType.fixed,
          // selectedLabelStyle: TextStyle(color: primaryColor),
          selectedFontSize: 12,
          selectedItemColor: Colors.purple,
          unselectedItemColor: Colors.transparent,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_2_outlined,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.person_2_outlined,
                color: Colors.purple,
              ),
              label: "profil",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.quiz_outlined,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.quiz_outlined,
                color: Colors.purple,
              ),
              label: "quiz",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.quiz_rounded,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.quiz_rounded,
                color: Colors.purple,
              ),
              label: "quiz1",
            ),
          ],
        ),
      ),
    );
  }
}
