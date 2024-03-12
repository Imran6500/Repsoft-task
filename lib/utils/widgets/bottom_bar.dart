import 'package:flutter/material.dart';
import 'package:task/screens/Home_screens/group_screen.dart';
import 'package:task/screens/Home_screens/home_screen.dart';
import 'package:task/screens/Home_screens/profile_screen.dart';
import 'package:task/screens/Home_screens/transaction_screen.dart';

import '../../resources/r.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int selectedIndex = 0;
  final List<Widget> bottomBarList = [
    const HomeScreen(),
    const GroupScreen(),
    const TransactionScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bottomBarList.elementAt(selectedIndex),
      bottomNavigationBar: Stack(
        children: [
          BottomNavigationBar(
            iconSize: 30,
            selectedFontSize: 0,
            selectedLabelStyle: TextStyle(),
            selectedItemColor: Colors.white,
            currentIndex: selectedIndex,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                backgroundColor: R.color.white,
                label: "home",
                icon: Image.asset("assets/images/home_page.png"),
              ),
              BottomNavigationBarItem(
                backgroundColor: const Color(0xff1b142c),
                label: "home",
                icon: Image.asset("assets/images/group.png"),
              ),
              BottomNavigationBarItem(
                backgroundColor: const Color(0xff1b142c),
                label: "home",
                icon: Image.asset("assets/images/Split_Transaction.png"),
              ),
              BottomNavigationBarItem(
                label: "home",
                backgroundColor: const Color(0xff1b142c),
                icon: Image.asset("assets/images/profile.png"),
              ),
            ],
          ),
          Positioned(
            left: MediaQuery.of(context).size.width /
                    bottomBarList.length *
                    selectedIndex +
                26,
            bottom: 5,
            width:
                MediaQuery.of(context).size.width / bottomBarList.length - 55,
            height: 2,
            child: Container(
              color: R.color.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
