import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
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

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
