import 'package:flutter/material.dart';
import 'package:nc_flutter_tiktok/constants/sizes.dart';

class StfScreen extends StatefulWidget {
  const StfScreen({super.key});

  @override
  State<StfScreen> createState() => _StfScreenState();
}

class _StfScreenState extends State<StfScreen> {
  int _clicks = 0;

  void _increase() {
    setState(() {
      _clicks++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$_clicks',
            style: TextStyle(fontSize: Sizes.size52),
          ),
          TextButton(
            onPressed: _increase,
            child: Text(
              '+',
              style: TextStyle(fontSize: Sizes.size52),
            ),
          ),
        ],
      ),
    );
  }
}
