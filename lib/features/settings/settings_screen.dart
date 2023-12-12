import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: [
          Switch.adaptive(
            value: _notifications,
            onChanged: _onNotificationsChanged,
          ),
          SwitchListTile.adaptive(
            activeColor: Colors.black,
            value: _notifications,
            onChanged: _onNotificationsChanged,
            title: Text('Switch Notifications'),
            subtitle: Text('this is subtitle'),
          ),
          CheckboxListTile(
            activeColor: Colors.black,
            value: _notifications,
            onChanged: _onNotificationsChanged,
            title: Text('Notifications'),
          ),
          ListTile(
            onTap: () async {
              final date = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime(2030),
              );
              print(date);
              final time = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
              print(time);
              final booking = await showDateRangePicker(
                  context: context,
                  firstDate: DateTime(2001),
                  lastDate: DateTime(2002),
                  builder: (context, child) {
                    return Theme(
                      data: ThemeData(
                        appBarTheme: AppBarTheme(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.black,
                        ),
                      ),
                      child: child!,
                    );
                  });
              print(booking);
            },
            title: Text(
              'What is your birthday?',
            ),
            subtitle: Text('About this app...'),
          ),
          ListTile(
            title: Text('Log out (iOS)'),
            textColor: Colors.red,
            onTap: () {
              showCupertinoDialog(
                context: context,
                builder: (context) => CupertinoAlertDialog(
                  title: Text('Are you sure?'),
                  content: Text('Please dont go'),
                  actions: [
                    CupertinoDialogAction(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text('No'),
                    ),
                    CupertinoDialogAction(
                      onPressed: () => Navigator.of(context).pop(),
                      isDestructiveAction: true,
                      child: Text('Yes'),
                    ),
                  ],
                ),
              );
            },
          ),
          ListTile(
            title: Text('Log out (Android)'),
            textColor: Colors.red,
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  icon: FaIcon(FontAwesomeIcons.skull),
                  title: Text('Are you sure?'),
                  content: Text('Please dont go'),
                  actions: [
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: FaIcon(FontAwesomeIcons.car),
                    ),
                    CupertinoDialogAction(
                      onPressed: () => Navigator.of(context).pop(),
                      isDestructiveAction: true,
                      child: Text('Yes'),
                    ),
                  ],
                ),
              );
            },
          ),
          AboutListTile()
        ],
      ),
    );
  }
}
