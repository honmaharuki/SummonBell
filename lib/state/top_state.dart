import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'top_state.g.dart';

@riverpod
class TopState extends _$TopState {
  @override
  int build() {
    return 0;
  }

  void addLink(int id) {
    state = id;
  }
}
