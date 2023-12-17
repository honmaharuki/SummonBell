import 'dart:io'; // DartのIOライブラリをインポート

import 'package:drift/native.dart'; // Driftパッケージからnativeをインポート
import 'package:path_provider/path_provider.dart'; // ファイルパスを提供するpath_providerパッケージをインポート
import 'package:path/path.dart' as p; // パス操作用のpathパッケージをpというエイリアスでインポート
import 'package:sqlite3/sqlite3.dart'; // SQLite3の操作に必要なsqlite3パッケージをインポート
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart'; // FlutterでSQLite3を使用するためのライブラリをインポート
import 'package:drift/drift.dart'; // Driftの主要な機能を含むdriftパッケージをインポート

part 'database.g.dart'; // Driftによって生成されるコードのパートを指定

class TodoItems extends Table {
  // Todoアイテム用のテーブル定義
  IntColumn get id => integer().autoIncrement()(); // IDカラム（自動インクリメント）
  TextColumn get title =>
      text().withLength(min: 6, max: 32)(); // タイトルカラム（最小6文字、最大32文字）
  TextColumn get content => text().named('body')(); // コンテンツカラム（bodyという名前で）
  IntColumn get category => integer().nullable()(); // カテゴリカラム（null許容）
}

@DriftDatabase(tables: [TodoItems]) // Driftデータベース定義、使用するテーブルを指定
class AppDatabase extends _$AppDatabase {
  // アプリのデータベースクラス
  AppDatabase() : super(_openConnection()); // コンストラクタでデータベース接続を開始

  @override
  int get schemaVersion => 1; // スキーマバージョン
}

LazyDatabase _openConnection() {
  // データベース接続の設定
  // LazyDatabaseユーティリティを使用してファイルの正しい場所を非同期で見つける
  return LazyDatabase(() async {
    // アプリのドキュメントフォルダにデータベースファイル（db.sqlite）を置く
    final dbFolder = await getApplicationDocumentsDirectory();
    String dbPath = p.join(dbFolder.path, 'db.sqlite');
    print('db location : ' + dbPath);
    final file = File(dbPath);

    // 古いAndroidバージョンでの制限に対処
    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    // SQLite3にサンドボックス化によりアクセス不能なシステムの一時ファイルの代わりに適切な場所を選択させる
    final cachebase = (await getTemporaryDirectory()).path;
    // Androidではデフォルトで試す/tmpにアクセスできないため、正しい一時ディレクトリについて明示的に指示する
    sqlite3.tempDirectory = cachebase;

    return NativeDatabase.createInBackground(file); // バックグラウンドでネイティブデータベースを作成
  });
}
