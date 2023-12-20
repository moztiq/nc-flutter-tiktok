import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nc_flutter_tiktok/common/widgets/video_config/video_config.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notifications = false;

  void _onNotificationsChanged(bool? value) {
    if (value == null) return;
    setState(() {
      _notifications = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Localizations.override(
      context: context,
      locale: Locale('ko'),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        body: ListView(
          children: [
            SwitchListTile.adaptive(
              activeColor: Colors.black,
              value: VideoConfigData.of(context).autoMute,
              onChanged: (value) => VideoConfigData.of(context).toggleMuted(),
              title: const Text('Auto Mute'),
              subtitle: const Text('Videos will be muted by default.'),
            ),
            CheckboxListTile(
              activeColor: Colors.black,
              value: _notifications,
              onChanged: _onNotificationsChanged,
              title: const Text('Marketing Email'),
              subtitle: const Text('We wont spam you'),
            ),
            ListTile(
              onTap: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2030),
                );
                if (kDebugMode) {
                  print(date);
                }

                if (!mounted) return;

                final time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (kDebugMode) {
                  print(time);
                }

                if (!mounted) return;

                final booking = await showDateRangePicker(
                  context: context,
                  firstDate: DateTime(2001),
                  lastDate: DateTime(2002),
                  builder: (context, child) {
                    return Theme(
                      data: ThemeData(
                        appBarTheme: const AppBarTheme(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.black,
                        ),
                      ),
                      child: child!,
                    );
                  },
                );
                if (kDebugMode) {
                  print(booking);
                }
              },
              title: const Text(
                'What is your birthday?',
              ),
              subtitle: const Text('About this app...'),
            ),
            ListTile(
              title: const Text('Log out (iOS)'),
              textColor: Colors.red,
              onTap: () {
                showCupertinoDialog(
                  context: context,
                  builder: (context) => CupertinoAlertDialog(
                    title: const Text('Are you sure?'),
                    content: const Text('Please dont go'),
                    actions: [
                      CupertinoDialogAction(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('No'),
                      ),
                      CupertinoDialogAction(
                        onPressed: () => Navigator.of(context).pop(),
                        isDestructiveAction: true,
                        child: const Text('Yes'),
                      ),
                    ],
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Log out (Android)'),
              textColor: Colors.red,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    icon: const FaIcon(FontAwesomeIcons.skull),
                    title: const Text('Are you sure?'),
                    content: const Text('Please dont go'),
                    actions: [
                      IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const FaIcon(FontAwesomeIcons.car),
                      ),
                      CupertinoDialogAction(
                        onPressed: () => Navigator.of(context).pop(),
                        isDestructiveAction: true,
                        child: const Text('Yes'),
                      ),
                    ],
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Log out (iOS / Bottom)'),
              textColor: Colors.red,
              onTap: () {
                showCupertinoModalPopup(
                  context: context,
                  builder: (context) => CupertinoActionSheet(
                    title: const Text('Are you sure?'),
                    message: const Text('Please don go'),
                    actions: [
                      CupertinoActionSheetAction(
                        isDefaultAction: true,
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('Not Log out'),
                      ),
                      CupertinoActionSheetAction(
                        onPressed: () => Navigator.of(context).pop(),
                        isDestructiveAction: true,
                        child: const Text('Yes'),
                      ),
                    ],
                  ),
                );
              },
            ),
            const AboutListTile()
          ],
        ),
      ),
    );
  }
}
