import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nc_flutter_tiktok/features/inbox/models/MessageModel.dart';

class MessagesRepo {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> sendMessage(MessageModel message) async {
    await _db
        .collection('chat_rooms')
        .doc('8lLqWnnQ4DmxKF8PBN7o')
        .collection('texts')
        .add(message.toJson());
  }
}

final messagesRepo = Provider((ref) => MessagesRepo());
