import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

import 'package:summon_bell/models/top_model.dart';
import 'package:summon_bell/screens/char_add.dart';
import 'package:summon_bell/screens/char_select.dart';
import 'package:summon_bell/screens/general_settings.dart';
import 'package:summon_bell/screens/open_ai_settings.dart';

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
      appBar: _buildAppBar(context),
      body: _buildBody(context, messages),
      drawer: _buildDrawer(context),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: const Text("Title"),
      leading: _buildDrawerButton(context),
      actions: _buildAppBarActions(),
    );
  }

  IconButton _buildDrawerButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.menu),
      onPressed: () => Scaffold.of(context).openDrawer(),
      tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
    );
  }

  List<Widget> _buildAppBarActions() {
    return [
      IconButton(
        icon: const Icon(Icons.settings),
        tooltip: 'Settings',
        onPressed: () {
          // Settings button logic here
        },
      ),
      IconButton(
        icon: const Icon(Icons.door_sliding_sharp),
        tooltip: 'Search',
        onPressed: () {
          // Search button logic here
        },
      ),
    ];
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
                _buildImageHeader(context),
                _buildChatSection(messages),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding _buildImageHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 4.0),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          double width = MediaQuery.of(context).size.width;
          double imageWidth = width - 16;
          return Image.asset(
            'assets/images/sura.png',
            width: imageWidth,
            fit: BoxFit.fitWidth,
          );
        },
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

  Drawer _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          _buildDrawerItem(context, 'Char Add', CharAddWidget()),
          _buildDrawerItem(context, 'Char Select', CharSelectWidget()),
          _buildDrawerItem(
              context, 'General Settings', GeneralSettingsWidget()),
          _buildDrawerItem(context, 'OpenAI Settings', OpenAISettingsWidget()),
        ],
      ),
    );
  }

  ListTile _buildDrawerItem(BuildContext context, String title, Widget widget) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.pop(context);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => widget));
      },
    );
  }
}
