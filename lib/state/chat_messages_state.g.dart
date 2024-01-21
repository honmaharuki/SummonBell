// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_messages_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$selectRoomHash() => r'5ca504cd9ebd2b2ccc5aeee70b55da8932344d7b';

/// See also [SelectRoom].
@ProviderFor(SelectRoom)
final selectRoomProvider =
    AutoDisposeNotifierProvider<SelectRoom, int>.internal(
  SelectRoom.new,
  name: r'selectRoomProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$selectRoomHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SelectRoom = AutoDisposeNotifier<int>;
String _$chatMessagesStateHash() => r'9bc8a18baeb6656bad8e821e3423de6980584031';

/// See also [ChatMessagesState].
@ProviderFor(ChatMessagesState)
final chatMessagesStateProvider = AutoDisposeAsyncNotifierProvider<
    ChatMessagesState, List<types.Message>>.internal(
  ChatMessagesState.new,
  name: r'chatMessagesStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$chatMessagesStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ChatMessagesState = AutoDisposeAsyncNotifier<List<types.Message>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
