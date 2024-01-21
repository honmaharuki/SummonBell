import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:summon_bell/state/database_provider.dart';

part 'chat_messages_state.g.dart';

@riverpod
class SelectRoom extends _$SelectRoom {
  @override
  int build() {
    return 1;
  }

  void addRoomId(int roomId) {
    state = roomId;
  }
}

@riverpod
class ChatMessagesState extends _$ChatMessagesState {
  @override
  Future<List<types.Message>> build() async {
    int roomId = ref.watch(selectRoomProvider) ?? 1;
    final database = ref.watch(databaseProvider);
    var messages = await database.messageDao.getRoomMessagesForChat(roomId);

    return messages;
  }

  @override
  AsyncValue<List<types.Message>> get state => super.state;

  Future<void> _reloadState() async {
    state = await AsyncValue.guard(() async {
      int roomId = ref.watch(selectRoomProvider) ?? -1;
      var messages = await _selectRoom(roomId);
      return messages;
    });
  }

  Future<List<types.Message>> _selectRoom(int roomId) async {
    final database = ref.watch(databaseProvider);
    var messages = await database.messageDao.getRoomMessagesForChat(roomId);
    return messages;
  }

  Future<void> addMessage(
      int roomId, int accountId, String message, int updatedAt) async {
    final database = ref.watch(databaseProvider);
    await database.messageDao
        .insertTextMessage(roomId, accountId, message, updatedAt);
    await _reloadState();
  }
}
