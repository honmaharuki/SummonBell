import 'package:flutter/material.dart';
import 'package:summon_bell/models/general_settings_model.dart';
export 'package:summon_bell/models/general_settings_model.dart';

class GeneralSettingsWidget extends StatefulWidget {
  const GeneralSettingsWidget({Key? key}) : super(key: key);

  @override
  _GeneralSettingsWidgetState createState() => _GeneralSettingsWidgetState();
}

class _GeneralSettingsWidgetState extends State<GeneralSettingsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).backgroundColor, // テーマの背景色を使用
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
                    color: Theme.of(context).primaryColor, // テーマのプライマリカラーを使用
                    onPressed: () {
                      Navigator.of(context).pop(); // 戻る処理
                    },
                  ),
                  Text(
                    'Setting',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  // この部分は空のコンテナに置き換えます
                  Container(width: 40),
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
