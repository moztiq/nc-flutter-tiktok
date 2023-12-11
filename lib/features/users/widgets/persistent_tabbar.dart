import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nc_flutter_tiktok/constants/sizes.dart';

class PersistentTabBar extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: const TabBar(
        labelPadding: EdgeInsets.symmetric(
          vertical: Sizes.size10,
        ),
        indicatorColor: Colors.black,
        indicatorSize: TabBarIndicatorSize.label,
        labelColor: Colors.black,
        tabs: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.size20,
            ),
            child: Icon(
              Icons.grid_4x4_rounded,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.size20,
            ),
            child: FaIcon(
              FontAwesomeIcons.heart,
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 46;

  @override
  double get minExtent => 46;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
