import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_fire_baze/el%20idhafet/profil.dart';
import 'profil.dart';
import 'quiz/pages/quiz.dart';
import 'quiz1/quiz1.dart';

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
    SvgPicture svgIcon(String src, {Color? color}) {
      return SvgPicture.asset(
        src,
        height: 24,
        colorFilter: ColorFilter.mode(
            color ??
                Theme.of(context).iconTheme.color!.withOpacity(
                    Theme.of(context).brightness == Brightness.dark ? 0.3 : 1),
            BlendMode.srcIn),
      );
    }

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
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          // selectedLabelStyle: TextStyle(color: primaryColor),
          selectedFontSize: 12,
          selectedItemColor: Color(0xFF7B61FF),
          unselectedItemColor: Colors.transparent,
          items: [
            BottomNavigationBarItem(
              icon: svgIcon("images/icons/Profile.svg"),
              activeIcon: svgIcon("images/icons/Profile.svg",
                  color: const Color(0xFF7B61FF)),
              label: "Profile",
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(
            //     Icons.person_2_outlined,
            //     color: Colors.black,
            //   ),
            //   activeIcon: Icon(
            //     Icons.person_2_outlined,
            //     color: Colors.purple,
            //   ),
            //   label: "profil",
            // ),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.quiz_outlined,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.quiz_outlined,
                color: Color(0xFF7B61FF),
              ),
              label: "quiz",
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.quiz_rounded,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.quiz_rounded,
                color: Color(0xFF7B61FF),
              ),
              label: "quiz1",
            ),
          ],
        ),
      ),
    );
  }
}
