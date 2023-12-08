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
            title: const Text('Discover'),
            bottom: TabBar(
              splashFactory: NoSplash.splashFactory,
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size16,
              ),
              isScrollable: true,
              labelColor: Colors.black,
              labelStyle: const TextStyle(
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
              Padding(
                padding: const EdgeInsets.all(Sizes.size6),
                child: GridView.builder(
                  itemCount: 20,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: Sizes.size10,
                    mainAxisSpacing: Sizes.size10,
                    childAspectRatio: 9 / 16,
                  ),
                  itemBuilder: (context, index) => Container(
                    color: Colors.blue,
                    child: Center(
                      child: Text('$index'),
                    ),
                  ),
                ),
              ),
              for (var tab in tabs.skip(1))
                Center(
                  child: Text(tab),
                ),
            ],
          )),
    );
  }
}
