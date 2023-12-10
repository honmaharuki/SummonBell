import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:summon_bell/models/top_model.dart';

// TopModel の Provider
final topModelProvider = Provider((ref) => TopModel(aId: 1));

class TopWidget extends HookConsumerWidget {
  const TopWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _model = ref.watch(topModelProvider);

    return Scaffold(
      backgroundColor: Color(0xFFEAEDF0),
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
    );
  }
}
