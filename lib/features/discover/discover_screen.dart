import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nc_flutter_tiktok/constants/sizes.dart';

final tabs = ['Top', 'Users', 'Videos', 'Sounds', 'LIVE', 'Shopping', 'Brands'];

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
          appBar: AppBar(
            title: Text('Discover'),
            bottom: TabBar(
              splashFactory: NoSplash.splashFactory,
              padding: EdgeInsets.symmetric(
                horizontal: Sizes.size16,
              ),
              isScrollable: true,
              labelColor: Colors.black,
              labelStyle: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: Sizes.size16,
              ),
              unselectedLabelColor: Colors.grey.shade500,
              indicatorColor: Colors.black,
              tabs: [
                for (var tab in tabs)
                  Tab(
                    text: tab,
                  )
              ],
            ),
          ),
          body: TabBarView(
            children: [
              for (var tab in tabs)
                Center(
                  child: Text(tab),
                ),
            ],
          )),
    );
  }
}
