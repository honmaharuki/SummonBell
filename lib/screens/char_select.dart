import 'package:flutter/material.dart';

import 'package:summon_bell/models/char_select_model.dart';

class CharSelectWidget extends StatefulWidget {
  const CharSelectWidget({Key? key}) : super(key: key);

  @override
  _CharSelectWidgetState createState() => _CharSelectWidgetState();
}

class _CharSelectWidgetState extends State<CharSelectWidget> {
  late CharSelectModel _model;

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
                    'Char Select',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  // この部分は空のコンテナに置き換えます
                  Container(width: 40),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5,
                            color: Color(0x230E151B),
                            offset: Offset(0, 2),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Link Title',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            SizedBox(height: 4),
                            Text(
                              'url',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
