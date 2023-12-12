import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nc_flutter_tiktok/constants/gaps.dart';
import 'package:nc_flutter_tiktok/constants/sizes.dart';
import 'package:nc_flutter_tiktok/features/settings/settings_screen.dart';
import 'package:nc_flutter_tiktok/features/users/widgets/persistent_tabbar.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  void _onGearPressed() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SettingsScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, index) => [
            SliverAppBar(
              title: Text('Moz'),
              actions: [
                IconButton(
                  onPressed: _onGearPressed,
                  icon: FaIcon(
                    FontAwesomeIcons.gear,
                    size: Sizes.size20,
                  ),
                )
              ],
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: Sizes.size48,
                    backgroundImage: NetworkImage(
                      'https://image.cine21.com/resize/cine21/still/2017/1218/10_39_22__5a371c4aaae6b[X252,310].jpg',
                    ),
                  ),
                  Gaps.v20,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '@moz',
                        style: TextStyle(
                          fontSize: Sizes.size18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Gaps.h8,
                      FaIcon(
                        FontAwesomeIcons.solidCircleCheck,
                        size: Sizes.size16,
                        color: Colors.blue.shade400,
                      )
                    ],
                  ),
                  Gaps.v24,
                  SizedBox(
                    height: Sizes.size48,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              '97',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: Sizes.size16,
                              ),
                            ),
                            Gaps.v3,
                            Text(
                              'Following',
                              style: TextStyle(
                                color: Colors.grey.shade400,
                                fontWeight: FontWeight.bold,
                                fontSize: Sizes.size14,
                              ),
                            ),
                          ],
                        ),
                        VerticalDivider(
                          color: Colors.grey.shade400,
                          width: Sizes.size32,
                          thickness: Sizes.size1,
                          indent: Sizes.size14,
                          endIndent: Sizes.size14,
                        ),
                        Column(
                          children: [
                            Text(
                              '10M',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: Sizes.size16,
                              ),
                            ),
                            Gaps.v3,
                            Text(
                              'Followers',
                              style: TextStyle(
                                color: Colors.grey.shade400,
                                fontWeight: FontWeight.bold,
                                fontSize: Sizes.size14,
                              ),
                            ),
                          ],
                        ),
                        VerticalDivider(
                          color: Colors.grey.shade400,
                          width: Sizes.size32,
                          thickness: Sizes.size1,
                          indent: Sizes.size14,
                          endIndent: Sizes.size14,
                        ),
                        Column(
                          children: [
                            Text(
                              '194.3M',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: Sizes.size16,
                              ),
                            ),
                            Gaps.v3,
                            Text(
                              'Likes',
                              style: TextStyle(
                                color: Colors.grey.shade400,
                                fontWeight: FontWeight.bold,
                                fontSize: Sizes.size14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Gaps.v14,
                  FractionallySizedBox(
                    widthFactor: 0.33,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: Sizes.size12,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            Sizes.size4,
                          ),
                        ),
                      ),
                      child: Text(
                        'Follow',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Gaps.v14,
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.size32,
                    ),
                    child: Text(
                      'All highlights and where to watch live matches on FIFA+ I wonder how it would look...',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Gaps.v14,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.link,
                        size: Sizes.size12,
                      ),
                      Gaps.h4,
                      Text(
                        'http://moztiq.com',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                  Gaps.v20,
                ],
              ),
            ),
            SliverPersistentHeader(
              delegate: PersistentTabBar(),
              pinned: true,
            )
          ],
          body: TabBarView(
            children: [
              GridView.builder(
                padding: EdgeInsets.zero,
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                itemCount: 20,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: Sizes.size2,
                  mainAxisSpacing: Sizes.size2,
                  childAspectRatio: 9 / 14,
                ),
                itemBuilder: (context, index) => Column(
                  children: [
                    AspectRatio(
                      aspectRatio: 9 / 14,
                      child: FadeInImage.assetNetwork(
                        placeholder: "assets/images/placeholder.jpg",
                        image:
                            "https://images.unsplash.com/photo-1545038495-06c466616626?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YmlnJTIwc2l6ZXxlbnwwfHwwfHx8MA%3D%3D",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Text('Page two'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
