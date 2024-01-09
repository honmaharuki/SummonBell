import 'dart:io'; // DartのIOライブラリをインポート

import 'package:drift/native.dart'; // Driftパッケージからnativeをインポート
import 'package:path_provider/path_provider.dart'; // ファイルパスを提供するpath_providerパッケージをインポート
import 'package:path/path.dart' as p; // パス操作用のpathパッケージをpというエイリアスでインポート
import 'package:sqlite3/sqlite3.dart'; // SQLite3の操作に必要なsqlite3パッケージをインポート
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart'; // FlutterでSQLite3を使用するためのライブラリをインポート
import 'package:drift/drift.dart';
import 'package:summon_bell/database/dao/accounts_dao.dart';
import 'package:summon_bell/database/dao/messages_dao.dart';
import 'package:summon_bell/database/dao/permissions_dao.dart';
import 'package:summon_bell/database/dao/room_participants_dao.dart';
import 'package:summon_bell/database/dao/rooms_dao.dart';
import 'package:summon_bell/database/dao/user_characters_dao.dart';
import 'package:summon_bell/database/dao/user_permissions_dao.dart';
import 'package:summon_bell/database/tables/accounts.dart';
import 'package:summon_bell/database/tables/messages.dart';
import 'package:summon_bell/database/tables/permissions.dart';
import 'package:summon_bell/database/tables/room_participants.dart';
import 'package:summon_bell/database/tables/rooms.dart';
import 'package:summon_bell/database/tables/user_characters.dart';
import 'package:summon_bell/database/tables/user_permissions.dart';

part 'database.g.dart'; // Driftによって生成されるコードのパートを指定

@DriftDatabase(tables: [
  Accounts,
  Messages,
  Permissions,
  RoomParticipants,
  Rooms,
  UserCharacters,
  UserPermissions,
], daos: [
  AccountDao,
  MessageDao,
  PermissionDao,
  RoomParticipantDao,
  RoomDao,
  UserCharacterDao,
  UserPermissionDao,
]) // Driftデータベース定義、使用するテーブルを指定
class AppDatabase extends _$AppDatabase {
  // アプリのデータベースクラス
  AppDatabase() : super(_openConnection()); // コンストラクタでデータベース接続を開始

  @override
  int get schemaVersion => 1; // スキーマバージョン
}

LazyDatabase _openConnection() {
  // データベース接続の設定
  // LazyDatabaseユーティリティを使用してファイルの正しい場所を非同期で見つける。
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
