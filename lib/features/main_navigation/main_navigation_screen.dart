import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nc_flutter_tiktok/features/main_navigation/stf_screen.dart';
import 'package:nc_flutter_tiktok/features/main_navigation/widgets/nav_tab.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Offstage(
          offstage: _selectedIndex != 0,
          child: const StfScreen(),
        ),
        Offstage(
          offstage: _selectedIndex != 1,
          child: const StfScreen(),
        ),
        Offstage(
          offstage: _selectedIndex != 3,
          child: const StfScreen(),
        ),
        Offstage(
          offstage: _selectedIndex != 4,
          child: const StfScreen(),
        ),
      ]),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NavBar(
              icon: FontAwesomeIcons.house,
              selectedIcon: FontAwesomeIcons.house,
              text: 'Home',
              isSelected: _selectedIndex == 0,
              onTap: () => _onTap(0),
            ),
            NavBar(
              icon: FontAwesomeIcons.compass,
              selectedIcon: FontAwesomeIcons.solidCompass,
              text: 'Discover',
              isSelected: _selectedIndex == 1,
              onTap: () => _onTap(1),
            ),
            NavBar(
              icon: FontAwesomeIcons.message,
              selectedIcon: FontAwesomeIcons.solidMessage,
              text: 'Inbox',
              isSelected: _selectedIndex == 3,
              onTap: () => _onTap(3),
            ),
            NavBar(
              icon: FontAwesomeIcons.user,
              selectedIcon: FontAwesomeIcons.solidUser,
              text: 'Profile',
              isSelected: _selectedIndex == 4,
              onTap: () => _onTap(4),
            ),
          ],
        ),
      ),
    );
  }
}