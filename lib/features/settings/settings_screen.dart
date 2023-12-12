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
      body: ListWheelScrollView(
        useMagnifier: true,
        magnification: 1.5,
        itemExtent: 200,
        children: [
          for (var x in [
            1,
            2,
            3,
            4,
            1,
            2,
            3,
            4,
            1,
            2,
            3,
            41,
            2,
            4,
            32,
            1,
            23,
            4,
          ])
            FractionallySizedBox(
              widthFactor: 1,
              child: Container(
                color: Colors.teal,
                alignment: Alignment.center,
                child: Text(
                  'Pick me',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Sizes.size36,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
