import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nc_flutter_tiktok/features/authentication/repos/authentication_repo.dart';
import 'package:nc_flutter_tiktok/features/users/view_models/users_view_model.dart';
import 'package:nc_flutter_tiktok/features/videos/models/video_model.dart';
import 'package:nc_flutter_tiktok/features/videos/repos/videos_repo.dart';

class UploadVideoViewModel extends AsyncNotifier<void> {
  late final VideosRepository _repository;

  @override
  FutureOr<void> build() {
    _repository = ref.read(videosRepo);
  }

  Future<void> uploadVideo(File video, BuildContext context) async {
    final user = ref.read(authRepo).user;
    final userProfile = ref.read(usersProvider).value;

    if (userProfile != null) {
      state = AsyncValue.loading();
      state = await AsyncValue.guard(
        () async {
          final task = await _repository.uploadVideoFile(video, user!.uid);
          if (task.metadata != null) {
            await _repository.saveVideo(
              VideoModel(
                title: 'From Flutter!',
                description: "Hell yeah!",
                fileUrl: await task.ref.getDownloadURL(),
                thumbnailUrl: '',
                likes: 0,
                comments: 0,
                creator: userProfile.name,
                creatorUid: user.uid,
                createdAt: DateTime.now().microsecondsSinceEpoch,
              ),
            );
          }
        },
      );
      context.pushReplacement('/home');
    }
  }
}

final uploadVideoProvider = AsyncNotifierProvider<UploadVideoViewModel, void>(
  () => UploadVideoViewModel(),
);
