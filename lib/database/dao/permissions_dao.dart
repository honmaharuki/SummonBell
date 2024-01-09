import 'package:drift/drift.dart';
import 'package:summon_bell/database/database.dart';
import 'package:summon_bell/database/tables/permissions.dart';

part 'permissions_dao.g.dart';

@DriftAccessor(tables: [Permissions])
class PermissionDao extends DatabaseAccessor<AppDatabase>
    with _$PermissionDaoMixin {
  PermissionDao(AppDatabase db) : super(db);

  Future<List<Permission>> getAllUsers() => select(permissions).get();
}
