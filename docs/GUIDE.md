部品切り出し例

新しいファイルを作成する: app_bar.dartのような名前のファイルを作成します。

コードを移動する: AppBar 関連のメソッド（_buildAppBar, _buildDrawerButton, _buildAppBarActions）を新しいファイルにコピーします。

必要なimportを追加する: 新しいファイルに、import 'package:flutter/material.dart'など必要なimport文を追加します。

ウィジェットを公開する: 新しいファイルで、これらのメソッドを公開するか、またはそれらを含む新しいクラスを作成します。

元のファイルを更新する: 元のファイルで新しいファイルをimportし、必要な箇所で新しいクラスやメソッドを参照します。


例
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:summon_bell/components/base_app_bar.dart';
import 'package:summon_bell/components/base_drawer.dart';
import 'package:summon_bell/components/base_image.dart';
import 'package:uuid/uuid.dart';

import 'package:summon_bell/models/top_model.dart';

// TopModel's Provider
final topModelProvider = Provider(
    (ref) => TopModel(aId: 1)); // Replace TopModel with your actual model

class TopWidget extends HookConsumerWidget {
  const TopWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _model = ref.watch(topModelProvider);
    final messages = useState<List<types.Message>>([]);

    return Scaffold(
      backgroundColor: const Color(0xFFEAEDF0),
      appBar: BaseAppBar(),
      body: _buildBody(context, messages),
      drawer: BaseDrawer(),
    );
  }

  SafeArea _buildBody(
      BuildContext context, ValueNotifier<List<types.Message>> messages) {
    return SafeArea(
      top: true,
      child: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                BaseImage(),
                _buildChatSection(messages),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _buildChatSection(ValueNotifier<List<types.Message>> messages) {
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


下記切り出し後
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

