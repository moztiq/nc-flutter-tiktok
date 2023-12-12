import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nc_flutter_tiktok/constants/sizes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            onTap: () => showAboutDialog(
                context: context,
                applicationVersion: '1.0',
                applicationLegalese: 'All rights reserved.'),
            title: Text(
              'About',
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text('About this app...'),
          ),
          AboutListTile()
        ],
      ),
    );
  }
}
