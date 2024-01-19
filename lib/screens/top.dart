import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:summon_bell/components/base_app_bar.dart';
import 'package:summon_bell/components/base_chat.dart';
import 'package:summon_bell/components/base_drawer.dart';
import 'package:summon_bell/components/base_image.dart';
import 'package:summon_bell/database/database.dart';

import 'package:summon_bell/models/top_model.dart';
import 'package:summon_bell/state/database_provider.dart';

// TopModel's Provider
final topModelProvider = Provider(
    (ref) => TopModel(aId: 1)); // Replace TopModel with your actual model

class TopWidget extends HookConsumerWidget {
  const TopWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _model = ref.watch(topModelProvider);
    final database = ref.watch(databaseProvider);
    final messages = useState<List<types.Message>>([]);

    return Scaffold(
      backgroundColor: const Color(0xFFEAEDF0),
      appBar: BaseAppBar(),
      body: _buildBody(context, messages, database),
      drawer: BaseDrawer(),
    );
  }

  SafeArea _buildBody(BuildContext context,
      ValueNotifier<List<types.Message>> messages, AppDatabase database) {
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
                ChatSection(messages: messages),
                ElevatedButton(
                  onPressed: () {
                    maindb(database); // ボタンが押されたときに実行するメソッド
                  },
                  child: Text('DB Test Start'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> maindb(AppDatabase database) async {
    WidgetsFlutterBinding.ensureInitialized();

    await database
        .into(database.permissions)
        .insert(PermissionsCompanion.insert(
          updatedAt: 'test',
          roles: 'test',
          level: 'test',
        ));
    List<Permission> allItems =
        await database.select(database.permissions).get();

    print('items in database: $allItems');
  }
}
