import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nc_flutter_tiktok/features/videos/models/video_model.dart';
import 'package:nc_flutter_tiktok/features/videos/repos/videos_repo.dart';

class TimelineViewModel extends AsyncNotifier<List<VideoModel>> {
  late final VideosRepository _repository;

  List<VideoModel> _list = [];

  Future<List<VideoModel>> _fetchVideos({int? lastItemCreatedAt}) async {
    final result = await _repository.fetchVideos(
      lastItemCreatedAt: lastItemCreatedAt,
    );
    final videos = result.docs.map((doc) => VideoModel.fromJson(doc.data()));
    return videos.toList();
  }

  @override
  FutureOr<List<VideoModel>> build() async {
    _repository = ref.read(videosRepo);

    _list = await _fetchVideos(lastItemCreatedAt: null);
    return _list;
  }

  fetchNextPage() async {
    final nextVideos =
        await _fetchVideos(lastItemCreatedAt: _list.last.createdAt);
    state = AsyncValue.data([..._list, ...nextVideos]);
  }
}

final timelineProvider =
    AsyncNotifierProvider<TimelineViewModel, List<VideoModel>>(
  () => TimelineViewModel(),
);
