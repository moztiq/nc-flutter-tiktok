import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nc_flutter_tiktok/constants/sizes.dart';
import 'package:nc_flutter_tiktok/utils.dart';

class PostVideoButton extends StatelessWidget {
  final bool inverted;

  const PostVideoButton({
    super.key,
    required this.inverted,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          right: Sizes.size20,
          child: Container(
            height: Sizes.size32,
            width: Sizes.size24,
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size8,
            ),
            decoration: BoxDecoration(
              color: const Color(0xff61d4f0),
              borderRadius: BorderRadius.circular(
                Sizes.size8,
              ),
            ),
          ),
        ),
        Positioned(
          left: Sizes.size20,
          child: Container(
            height: Sizes.size32,
            width: Sizes.size24,
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size8,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(
                Sizes.size8,
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size12,
          ),
          decoration: BoxDecoration(
            color:
                inverted || isDarkMode(context) ? Colors.white : Colors.black,
            borderRadius: BorderRadius.circular(
              Sizes.size6,
            ),
          ),
          height: Sizes.size32,
          child: FaIcon(
            FontAwesomeIcons.plus,
            color:
                inverted || isDarkMode(context) ? Colors.black : Colors.white,
            size: Sizes.size18,
          ),
        ),
      ],
    );
  }
}
