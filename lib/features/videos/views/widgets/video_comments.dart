import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nc_flutter_tiktok/constants/gaps.dart';
import 'package:nc_flutter_tiktok/constants/sizes.dart';
import 'package:nc_flutter_tiktok/generated/l10n.dart';
import 'package:nc_flutter_tiktok/utils.dart';

class VideoComments extends StatefulWidget {
  const VideoComments({super.key});

  @override
  State<VideoComments> createState() => _VideoCommentsState();
}

class _VideoCommentsState extends State<VideoComments> {
  bool _isWriting = false;
  final ScrollController _scrollController = ScrollController();

  void _onClosedPressed() {
    Navigator.of(context).pop();
  }

  void _onStopWriting() {
    FocusScope.of(context).unfocus();
    setState(() {
      _isWriting = false;
    });
  }

  void _onStartWriting() {
    setState(() {
      _isWriting = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode(context);
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          Sizes.size20,
        ),
      ),
      child: Scaffold(
        backgroundColor: isDark ? null : Colors.grey.shade50,
        appBar: AppBar(
          backgroundColor: isDark ? null : Colors.grey.shade50,
          title: Text(S.of(context).commentTitle(1, 1)),
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
        body: GestureDetector(
          onTap: _onStopWriting,
          child: Scrollbar(
            controller: _scrollController,
            child: ListView.separated(
              padding: const EdgeInsets.only(
                top: Sizes.size10,
                bottom: Sizes.size96 + Sizes.size20,
                left: Sizes.size16,
                right: Sizes.size16,
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
          ),
        ),
        bottomSheet: BottomAppBar(
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
                  onTap: _onStartWriting,
                  expands: true,
                  minLines: null,
                  maxLines: null,
                  textInputAction: TextInputAction.newline,
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
                    fillColor:
                        isDark ? Colors.grey.shade700 : Colors.grey.shade300,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: Sizes.size12,
                      horizontal: Sizes.size10,
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(
                        right: Sizes.size14,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.at,
                            color: isDark
                                ? Colors.grey.shade400
                                : Colors.grey.shade900,
                          ),
                          Gaps.h12,
                          FaIcon(
                            FontAwesomeIcons.gift,
                            color: isDark
                                ? Colors.grey.shade400
                                : Colors.grey.shade900,
                          ),
                          Gaps.h12,
                          FaIcon(
                            FontAwesomeIcons.faceSmile,
                            color: isDark
                                ? Colors.grey.shade400
                                : Colors.grey.shade900,
                          ),
                          Gaps.h12,
                          if (_isWriting)
                            GestureDetector(
                              onTap: _onStopWriting,
                              child: FaIcon(
                                FontAwesomeIcons.circleArrowUp,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                        ],
                      ),
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
