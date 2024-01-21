import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:summon_bell/state/chat_messages_state.dart';
import 'package:summon_bell/state/chat_messages_state.dart';
import 'package:summon_bell/state/database_provider.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as chat_types;

class ChatSection extends ConsumerWidget {
  final int roomId;
  ChatSection({required this.roomId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messages = ref.watch(chatMessagesStateProvider).when(
        data: (value) => value,
        error: (e, stack) => <types.Message>[],
        loading: () => <types.Message>[]);
    return _buildChatUI(context, messages, ref);
  }

  Widget _buildChatUI(
      BuildContext context, List<types.Message> messages, WidgetRef ref) {
    //TODO 現在のユーザーを取得する処理に変更する
    List<types.User> users = [
      types.User(id: '1', firstName: 'User', lastName: 'One'),
      types.User(id: '2', firstName: 'User2', lastName: 'One2'),
      types.User(id: '3', firstName: 'User3', lastName: 'One3'),
      // ...他のユーザー
    ];

    Random random = new Random();
    types.User randomUser = users[random.nextInt(users.length)];

    return Container(
      height: 400,
      child: Chat(
        messages: messages,
        onSendPressed: (message) =>
            _handleSendPressed(message, ref, randomUser, roomId),
        user: users[0],
        showUserNames: true,
        showUserAvatars: true,
      ),
    );
  }

  Future<void> _handleSendPressed(types.PartialText message, WidgetRef ref,
      types.User user, int roomId) async {
    //HACK モデルで渡したほうがいい
    ref.read(chatMessagesStateProvider.notifier).addMessage(
        roomId,
        int.parse(user.id),
        message.text,
        DateTime.now().millisecondsSinceEpoch);
  }
}
