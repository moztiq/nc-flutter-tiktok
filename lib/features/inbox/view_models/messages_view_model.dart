import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nc_flutter_tiktok/features/authentication/repos/authentication_repo.dart';
import 'package:nc_flutter_tiktok/features/inbox/models/MessageModel.dart';
import 'package:nc_flutter_tiktok/features/inbox/repos/messages_repo.dart';

class MessagesViewModel extends AsyncNotifier<void> {
  late final MessagesRepo _repo;

  @override
  FutureOr<void> build() {
    _repo = ref.read(messagesRepo);
  }

  Future<void> sendMessage(String text) async {
    state = AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      final message =
          MessageModel(text: text, userId: ref.read(authRepo).user!.uid);
      await _repo.sendMessage(message);
    });
  }
}

final messagesProvider = AsyncNotifierProvider<MessagesViewModel, void>(
  () => MessagesViewModel(),
);
