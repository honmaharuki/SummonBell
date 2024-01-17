import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:uuid/uuid.dart';

class ChatSection extends StatelessWidget {
  final ValueNotifier<List<types.Message>> messages;

  const ChatSection({Key? key, required this.messages}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<types.User> users = [
      types.User(id: '1', firstName: 'User', lastName: 'One'),
      types.User(id: '2', firstName: 'User', lastName: 'Two'),
      types.User(id: '3', firstName: 'User', lastName: 'T3wo'),
    ];

    Random random = new Random();

    types.User randomUser = users[random.nextInt(users.length)];

    return Container(
      height: 400,
      child: Chat(
        messages: messages.value,
        onSendPressed: (message) =>
            _handleSendPressed(message, messages, randomUser),
        user: users[0],
        showUserNames: true, // ユーザー名を表示する
        showUserAvatars: true,
      ),
    );
  }

  void _handleSendPressed(types.PartialText message,
      ValueNotifier<List<types.Message>> messages, types.User randomUser) {
    final textMessage = types.TextMessage(
      author: randomUser,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: message.text,
    );

    messages.value = [textMessage, ...messages.value];
    // Implement logic to send message to server
  }
}
