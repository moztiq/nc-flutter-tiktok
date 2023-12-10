import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nc_flutter_tiktok/constants/sizes.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text('Direct Messages'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const FaIcon(
              FontAwesomeIcons.plus,
            ),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size10,
        ),
        children: [
          ListTile(
            leading: const CircleAvatar(
              radius: Sizes.size24,
              backgroundImage: NetworkImage(
                'https://image.cine21.com/resize/cine21/still/2017/1218/10_39_22__5a371c4aaae6b[X252,310].jpg',
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  'Title',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '2:16 PM',
                  style: TextStyle(
                    color: Colors.grey.shade400,
                    fontSize: Sizes.size12,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
            subtitle: const Text('Good night. See you tomorrow!'),
          )
        ],
      ),
    );
  }
}
