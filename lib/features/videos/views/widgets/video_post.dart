import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nc_flutter_tiktok/constants/gaps.dart';
import 'package:nc_flutter_tiktok/constants/sizes.dart';
import 'package:nc_flutter_tiktok/features/videos/view_models/playback_config_vm.dart';
import 'package:nc_flutter_tiktok/features/videos/views/widgets/video_button.dart';
import 'package:nc_flutter_tiktok/features/videos/views/widgets/video_comments.dart';
import 'package:nc_flutter_tiktok/generated/l10n.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VideoPost extends StatefulWidget {
  final Function onVideoFinished;
  final int index;

  const VideoPost({
    super.key,
    required this.onVideoFinished,
    required this.index,
  });

  @override
  State<VideoPost> createState() => _VideoPostState();
}

class _VideoPostState extends State<VideoPost>
    with SingleTickerProviderStateMixin {
  final VideoPlayerController _videoPlayerController =
      VideoPlayerController.asset('assets/videos/video.mp4');

  bool _isPaused = false;
  final Duration _animationDuration = const Duration(milliseconds: 200);

  late final AnimationController _animationController;

  void _onVideoChange() {
    if (_videoPlayerController.value.isInitialized) {
      if (_videoPlayerController.value.duration ==
          _videoPlayerController.value.position) {
        widget.onVideoFinished();
      }
    }
  }

  void _initVideoPlayer() async {
    await _videoPlayerController.initialize();
    setState(() {});
    await _videoPlayerController.setLooping(true);
    _videoPlayerController.addListener(_onVideoChange);

    if (kIsWeb) {
      _videoPlayerController.setVolume(0);
    }
  }

  @override
  void initState() {
    super.initState();
    _initVideoPlayer();
    _animationController = AnimationController(
      vsync: this,
      lowerBound: 1.0,
      upperBound: 1.5,
      value: 1.5,
      duration: _animationDuration,
    );

    context
        .read<PlaybackConfigViewModel>()
        .addListener(_onPlaybackConfigChanged);
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  void _onPlaybackConfigChanged() {
    if (!mounted) return;
    final muted = context.read<PlaybackConfigViewModel>().muted;
    if (muted) {
      _videoPlayerController.setVolume(0);
    } else {
      _videoPlayerController.setVolume(1);
    }
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (!mounted) return;

    if (info.visibleFraction == 1 &&
        !_isPaused &&
        !_videoPlayerController.value.isPlaying) {
      final autoplay = context.read<PlaybackConfigViewModel>().autoplay;
      if (autoplay) {
        _videoPlayerController.play();
      }
    }
    if (_videoPlayerController.value.isPlaying && info.visibleFraction == 0) {
      _onTogglePause();
    }
  }

  void _onTogglePause() {
    if (_videoPlayerController.value.isPlaying) {
      _videoPlayerController.pause();
      _animationController.reverse();
    } else {
      _videoPlayerController.play();
      _animationController.forward();
    }
    setState(() {
      _isPaused = !_isPaused;
    });
  }

  void _onCommentsTap(BuildContext context) async {
    if (_videoPlayerController.value.isPlaying) {
      _onTogglePause();
    }
    await showModalBottomSheet(
      scrollControlDisabledMaxHeightRatio: 0.75,
      context: context,
      // backgroundColor: Colors.transparent,
      builder: (context) => VideoComments(),
    );
    _onTogglePause();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key('${widget.index}'),
      onVisibilityChanged: _onVisibilityChanged,
      child: Stack(
        children: [
          Positioned.fill(
            child: _videoPlayerController.value.isInitialized
                ? VideoPlayer(_videoPlayerController)
                : Container(
                    color: Colors.black,
                  ),
          ),
          Positioned.fill(
            child: GestureDetector(
              onTap: _onTogglePause,
            ),
          ),
          Positioned.fill(
            child: IgnorePointer(
              child: Center(
                child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _animationController.value,
                      child: child,
                    );
                  },
                  child: AnimatedOpacity(
                    duration: _animationDuration,
                    opacity: _isPaused ? 1 : 0,
                    child: const FaIcon(
                      FontAwesomeIcons.play,
                      color: Colors.white,
                      size: Sizes.size48,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 20,
            top: 40,
            child: IconButton(
              icon: FaIcon(
                context.watch<PlaybackConfigViewModel>().muted
                    ? FontAwesomeIcons.volumeOff
                    : FontAwesomeIcons.volumeHigh,
                color: Colors.white,
              ),
              onPressed: () {
                final muted = context.read<PlaybackConfigViewModel>().muted;
                context.read<PlaybackConfigViewModel>().setMuted(!muted);
              },
            ),
          ),
          const Positioned(
            bottom: 30,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '@moztiq',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Sizes.size20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Gaps.v10,
                Text(
                  'mozart music quiz',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Sizes.size14,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 30,
            right: 20,
            child: Column(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  child: Text('moz'),
                  foregroundImage: NetworkImage(
                    'https://avatars.githubusercontent.com/u/12403584?v=4',
                  ),
                ),
                Gaps.v24,
                VideoButton(
                  icon: FontAwesomeIcons.solidHeart,
                  text: S.of(context).likeCount(9187912342834),
                ),
                Gaps.v24,
                GestureDetector(
                  onTap: () => _onCommentsTap(context),
                  child: VideoButton(
                    icon: FontAwesomeIcons.solidComment,
                    text: S.of(context).commentCount(2738741),
                  ),
                ),
                Gaps.v24,
                VideoButton(
                  icon: FontAwesomeIcons.share,
                  text: 'Share',
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
