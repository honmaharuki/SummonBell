import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:summon_bell/database/database.dart';

// Riverpodプロバイダーを使用してAppDatabaseのインスタンスを提供
final databaseProvider = Provider<AppDatabase>((ref) {
  final database = AppDatabase();
  ref.onDispose(database.close);
  return database;
});
