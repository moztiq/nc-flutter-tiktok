import 'dart:async';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nc_flutter_tiktok/features/authentication/repos/authentication_repo.dart';
import 'package:nc_flutter_tiktok/features/users/repos/user_repository.dart';

class AvatarViewModel extends AsyncNotifier<void> {
  late final UserRepository _repository;

  @override
  FutureOr<void> build() {
    _repository = ref.read(userRepo);
  }

  Future<void> uploadAvatar(File file) async {
    state = AsyncValue.loading();
    final fileName = ref.read(authRepo).user!.uid;
    state = await AsyncValue.guard(
      () async => _repository.uploadAvatar(file, fileName),
    );
  }
}
