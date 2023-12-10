import 'package:flutter/material.dart';

class TopModel extends ChangeNotifier {
  final int aId;
  late TextEditingController textController;
  late FocusNode textFieldFocusNode;

  TopModel({required this.aId}) {
    textController = TextEditingController();
    textFieldFocusNode = FocusNode();
  }

  @override
  void dispose() {
    textController.dispose();
    textFieldFocusNode.dispose();
    super.dispose();
  }

  // 他のメソッド
}
