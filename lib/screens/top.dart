import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:summon_bell/models/top_model.dart';

import 'package:summon_bell/screens/char_add.dart';
import 'package:summon_bell/screens/char_select.dart';
import 'package:summon_bell/screens/general_settings.dart';
import 'package:summon_bell/screens/open_ai_settings.dart';

// TopModel の Provider
final topModelProvider = Provider((ref) => TopModel(aId: 1));

class TopWidget extends HookConsumerWidget {
  const TopWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _model = ref.watch(topModelProvider);

    Widget _buildListTile(String title, Widget Function() buildRoute) {
      return ListTile(
        title: Text(title),
        onTap: () {
          Navigator.pop(context);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => buildRoute()));
        },
      );
    }

    return Scaffold(
      backgroundColor: Color(0xFFEAEDF0),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("title"),
      ),
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            // 他のウィジェット部分は省略
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                    child: TextFormField(
                      controller: _model.textController,
                      focusNode: _model.textFieldFocusNode,
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Label here...',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    print('Button pressed ...');
                  },
                  child: Text('Button'),
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor,
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
            // 他のウィジェット部分は省略
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            _buildListTile('Char Add', () => CharAddWidget()),
            _buildListTile('Char Select', () => CharSelectWidget()),
            _buildListTile('General Settings', () => GeneralSettingsWidget()),
            _buildListTile('OpenAI Settings', () => OpenAISettingsWidget()),
          ],
        ),
      ),
    );
  }
}
