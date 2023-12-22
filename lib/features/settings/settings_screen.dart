import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nc_flutter_tiktok/features/videos/view_models/playback_config_vm.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              value: ref.watch(playbackConfigProvider).muted,
              onChanged: (value) {
                ref.read(playbackConfigProvider.notifier).setMuted(value);
              },
              title: const Text('Mute video'),
              subtitle: const Text('Video will be muted by default.'),
            ),
            SwitchListTile.adaptive(
              activeColor: Colors.black,
              value: ref.watch(playbackConfigProvider).autoplay,
              onChanged: (value) {
                ref.read(playbackConfigProvider.notifier).setAutoplay(value);
              },
              title: const Text('Autoplay'),
              subtitle: const Text('Video will start playing automatically.'),
            ),
            SwitchListTile.adaptive(
              activeColor: Colors.black,
              value: false,
              onChanged: (value) {},
              title: const Text('Enable Notifications'),
              subtitle: const Text('They will be cute.'),
            ),
            CheckboxListTile(
              activeColor: Colors.black,
              value: false,
              onChanged: (value) {},
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

                final time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (kDebugMode) {
                  print(time);
                }

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
