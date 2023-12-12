import 'package:flutter/material.dart';
import 'package:summon_bell/screens/char_add.dart';
import 'package:summon_bell/screens/char_select.dart';
import 'package:summon_bell/screens/general_settings.dart';
import 'package:summon_bell/screens/open_ai_settings.dart';
import 'package:summon_bell/screens/top.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0; // 現在の選択されているインデックス

  // 各画面に対応するウィジェット
  final _pages = [
    TopWidget(),
    CharAddWidget(),
    CharSelectWidget(),
    GeneralSettingsWidget(),
    OpenAISettingsWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo'),
      ),
      body: Center(
        child: _pages.elementAt(_selectedIndex), // 現在選択されている画面を表示
      ),
    );
  }
}
