import 'package:drift/drift.dart';
import 'package:summon_bell/database/database.dart';
import 'package:summon_bell/database/tables/user_permissions.dart';

part 'user_permissions_dao.g.dart';

@DriftAccessor(tables: [UserPermissions])
class UserPermissionDao extends DatabaseAccessor<AppDatabase>
    with _$UserPermissionDaoMixin {
  UserPermissionDao(AppDatabase db) : super(db);

  Future<List<UserPermission>> getAllUsers() => select(userPermissions).get();
}
