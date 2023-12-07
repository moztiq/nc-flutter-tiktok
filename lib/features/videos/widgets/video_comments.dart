import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nc_flutter_tiktok/constants/gaps.dart';
import 'package:nc_flutter_tiktok/constants/sizes.dart';

class VideoComments extends StatelessWidget {
  const VideoComments({super.key});

  @override
  Widget build(BuildContext context) {
    void _onClosedPressed() {
      Navigator.of(context).pop();
    }

    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          Sizes.size20,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade50,
          title: const Text('2274 comments'),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              onPressed: _onClosedPressed,
              icon: const Icon(
                Icons.close,
              ),
            )
          ],
        ),
        body: ListView.separated(
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.size10,
            horizontal: Sizes.size16,
          ),
          itemCount: 10,
          itemBuilder: (context, index) => Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                child: Text('moz'),
              ),
              Gaps.h10,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'moz',
                      style: TextStyle(
                        fontSize: Sizes.size16,
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Gaps.v5,
                    const Text(
                      'How am I supposed to be without you? Too so long.. HOw ??',
                    ),
                  ],
                ),
              ),
              Gaps.h10,
              Column(
                children: [
                  FaIcon(
                    FontAwesomeIcons.heart,
                    color: Colors.grey.shade500,
                    size: Sizes.size20,
                  ),
                  Gaps.v5,
                  Text(
                    '52.2K',
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          separatorBuilder: (BuildContext context, int index) {
            return Gaps.v24;
          },
        ),
        bottomSheet: BottomAppBar(
          color: Colors.white,
          child: Row(
            children: [
              CircleAvatar(
                radius: Sizes.size18,
                backgroundColor: Colors.grey.shade500,
                foregroundColor: Colors.white,
                child: const Text('moz'),
              ),
              Gaps.h10,
              Expanded(
                child: TextField(
                  cursorColor: Theme.of(context).primaryColor,
                  decoration: InputDecoration(
                    hintText: 'Add comment..',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        Sizes.size14,
                      ),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade300,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: Sizes.size12,
                      horizontal: Sizes.size10,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
