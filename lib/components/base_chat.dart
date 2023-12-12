import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:uuid/uuid.dart';

class ChatSection extends StatelessWidget {
  final ValueNotifier<List<types.Message>> messages;

  const ChatSection({Key? key, required this.messages}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: Chat(
        messages: messages.value,
        onSendPressed: (message) => _handleSendPressed(message, messages),
        user: const types.User(id: 'user_id'),
      ),
    );
  }

  void _handleSendPressed(
      types.PartialText message, ValueNotifier<List<types.Message>> messages) {
    final textMessage = types.TextMessage(
      author: const types.User(id: 'user_id'),
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: message.text,
    );

    messages.value = [...messages.value, textMessage];
    // Implement logic to send message to server
  }
}
