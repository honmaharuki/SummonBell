import 'package:flutter/material.dart';

import 'package:summon_bell/models/char_add_model.dart';

class CharAddWidget extends StatefulWidget {
  const CharAddWidget({Key? key}) : super(key: key);

  @override
  _CharAddWidgetState createState() => _CharAddWidgetState();
}

class _CharAddWidgetState extends State<CharAddWidget> {
  late CharAddModel _model;

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
                    'Char Add',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  // この部分は空のコンテナに置き換えます
                  Container(width: 40),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24, 20, 24, 36),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // 戻る処理
                      },
                      child: Text('Add'),
                      style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).primaryColor,
                        onPrimary: Colors.white,
                        textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
