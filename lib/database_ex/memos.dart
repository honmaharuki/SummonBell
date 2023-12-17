import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'memos.g.dart';

@DataClassName('Memo')
class Memos extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 1, max: 50)();
  TextColumn get content => text().withLength(min: 1, max: 1000)();
}

/// `Memos`テーブルを含むデータベースを表現するクラス。
@DriftDatabase(tables: [Memos])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  /// データベースのスキーマバージョンを返す。現在は1。
  @override
  int get schemaVersion => 1;
}

/// アプリのドキュメントディレクトリにデータベースファイルを生成し、接続する。
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'memos.sqlite'));
    return NativeDatabase(file);
  });
}
