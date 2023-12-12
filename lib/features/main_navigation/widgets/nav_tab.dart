import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nc_flutter_tiktok/constants/gaps.dart';
import 'package:nc_flutter_tiktok/utils.dart';

class NavBar extends StatelessWidget {
  final IconData icon;
  final IconData selectedIcon;
  final String text;
  final bool isSelected;
  final Function onTap;
  final int selectedIndex;

  const NavBar({
    super.key,
    required this.icon,
    required this.text,
    required this.isSelected,
    required this.onTap,
    required this.selectedIcon,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(),
        child: Container(
          color: isDarkMode(context) ? Colors.black : Colors.white,
          child: AnimatedOpacity(
            duration: const Duration(
              milliseconds: 200,
            ),
            opacity: isSelected ? 1 : 0.7,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FaIcon(
                  isSelected ? selectedIcon : icon,
                  color: isDarkMode(context) ? Colors.white : Colors.black,
                ),
                Gaps.v5,
                Text(
                  text,
                  style: TextStyle(
                    color: isDarkMode(context) ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
