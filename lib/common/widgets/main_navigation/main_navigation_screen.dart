import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:nc_flutter_tiktok/constants/gaps.dart';
import 'package:nc_flutter_tiktok/features/discover/discover_screen.dart';
import 'package:nc_flutter_tiktok/common/widgets/main_navigation/widgets/nav_tab.dart';
import 'package:nc_flutter_tiktok/common/widgets/main_navigation/widgets/post_video_button.dart';
import 'package:nc_flutter_tiktok/features/inbox/views/inbox_screen.dart';
import 'package:nc_flutter_tiktok/features/users/user_profile_screen.dart';
import 'package:nc_flutter_tiktok/features/videos/views/video_recording_screen.dart';
import 'package:nc_flutter_tiktok/features/videos/views/video_timeline_screen.dart';
import 'package:nc_flutter_tiktok/utils.dart';

class MainNavigationScreen extends StatefulWidget {
  static const String routeName = "mainNavigation";

  final String tab;

  const MainNavigationScreen({super.key, required this.tab});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  List<String> _tabs = ["home", "discover", "xxx", "inbox", "profile"];
  late int _selectedIndex = _tabs.indexOf(widget.tab);

  void _onTap(int index) {
    context.go("/${_tabs[index]}");
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onPostVideoButtonTap() {
    context.pushNamed(VideoRecordingScreen.routeName);
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (context) => Scaffold(
    //       appBar: AppBar(
    //         title: const Text(
    //           'Record video',
    //         ),
    //       ),
    //     ),
    //     fullscreenDialog: true,
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor:
          _selectedIndex == 0 || isDark ? Colors.black : Colors.white,
      body: Stack(children: [
        Offstage(
          offstage: _selectedIndex != 0,
          child: const VideoTimelineScreen(),
        ),
        Offstage(
          offstage: _selectedIndex != 1,
          child: DiscoverScreen(),
        ),
        Offstage(
          offstage: _selectedIndex != 3,
          child: InboxScreen(),
        ),
        Offstage(
          offstage: _selectedIndex != 4,
          child: UserProfileScreen(username: 'moz', tab: ''),
        ),
      ]),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: isDarkMode(context) ? Colors.black : Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NavBar(
              icon: FontAwesomeIcons.house,
              selectedIcon: FontAwesomeIcons.house,
              text: 'Home',
              isSelected: _selectedIndex == 0,
              onTap: () => _onTap(0),
              selectedIndex: _selectedIndex,
            ),
            NavBar(
              icon: FontAwesomeIcons.compass,
              selectedIcon: FontAwesomeIcons.solidCompass,
              text: 'Discover',
              isSelected: _selectedIndex == 1,
              onTap: () => _onTap(1),
              selectedIndex: _selectedIndex,
            ),
            Gaps.h24,
            GestureDetector(
              onTap: _onPostVideoButtonTap,
              child: PostVideoButton(inverted: _selectedIndex == 0),
            ),
            Gaps.h24,
            NavBar(
              icon: FontAwesomeIcons.message,
              selectedIcon: FontAwesomeIcons.solidMessage,
              text: 'Inbox',
              isSelected: _selectedIndex == 3,
              onTap: () => _onTap(3),
              selectedIndex: _selectedIndex,
            ),
            NavBar(
              icon: FontAwesomeIcons.user,
              selectedIcon: FontAwesomeIcons.solidUser,
              text: 'Profile',
              isSelected: _selectedIndex == 4,
              onTap: () => _onTap(4),
              selectedIndex: _selectedIndex,
            ),
          ],
        ),
      ),
    );
  }
}
