import 'package:drift/drift.dart';
import 'package:summon_bell/database/database.dart';
import 'package:summon_bell/database/tables/permissions.dart';

part 'permissions_dao.g.dart';

@DriftAccessor(tables: [Permissions])
class PermissionDao extends DatabaseAccessor<AppDatabase>
    with _$PermissionDaoMixin {
  PermissionDao(AppDatabase db) : super(db);

  Future<List<Permission>> getAllPermissions() => select(permissions).get();
  /*MEMO 下記と同じ処理
    Future<List<Permission>> getAllPermissions() {
    return select(permissions).get();
  }
  */

  Future<void> insertPermission() async {
    await into(permissions).insert(PermissionsCompanion.insert(
      updatedAt: 'test',
      roles: 'test',
      level: 'test',
    ));
  }
  /*MEMO 下記のように呼び出す側で、databeseインスタんを使って呼び出すことも可能ではあるが控えてもらいたい。
      await database
        .into(database.permissions)
        .insert(PermissionsCompanion.insert(
          updatedAt: 'test',
          roles: 'test',
          level: 'test',
        ));
    List<Permission> allItems =
        await database.select(database.permissions).get();
  */
}
