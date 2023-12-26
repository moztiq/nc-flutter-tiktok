import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nc_flutter_tiktok/features/users/models/user_profile_model.dart';

class UserRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // create profile
  Future<void> createProfile(UserProfileModel user) async {
    // _db.
  }
// get profile

// update profile
}

final userRepo = Provider((ref) => UserRepository());
