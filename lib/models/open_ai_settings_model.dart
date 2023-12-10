import 'package:flutter/material.dart';

class OpenAiSettingsModel extends ChangeNotifier {
  final int aId;
  late TextEditingController textController;
  late FocusNode textFieldFocusNode;

  OpenAiSettingsModel({required this.aId}) {
    textController = TextEditingController();
    textFieldFocusNode = FocusNode();
  }

  @override
  void dispose() {
    textController.dispose();
    textFieldFocusNode.dispose();
    super.dispose();
  }

  // 他のメソッドや状態の更新メソッドをここに追加
}
