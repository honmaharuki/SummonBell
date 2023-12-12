import 'package:flutter/material.dart';
import 'package:summon_bell/screens/char_add.dart';
import 'package:summon_bell/screens/char_select.dart';
import 'package:summon_bell/screens/general_settings.dart';
import 'package:summon_bell/screens/open_ai_settings.dart';

class BaseDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
