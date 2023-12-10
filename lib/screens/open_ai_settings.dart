import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:summon_bell/models/open_ai_settings_model.dart';

// TopModel の Provider
final openAISettingsModelProvider =
    Provider((ref) => OpenAiSettingsModel(aId: 1));

class OpenAISettingsWidget extends HookConsumerWidget {
  const OpenAISettingsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // OpenAISettingsModel の状態を監視する
    final _model = ref.watch(openAISettingsModelProvider);

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  Text(
                    'AI Setting',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(width: 40), // ボタンのサイズに合わせるための空のボックス
                ],
              ),
            ),
            // 他のウィジェット部分は省略
          ],
        ),
      ),
    );
  }
}
