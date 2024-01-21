import 'package:drift/drift.dart';
import 'package:summon_bell/database/tables/accounts.dart';
import 'package:summon_bell/database/tables/permissions.dart';

@DataClassName('UserPermission')
class UserPermissions extends Table {
  IntColumn get accountId => integer().references(Accounts, #accountId)();
  IntColumn get permissionId =>
      integer().references(Permissions, #permissionId)();
  IntColumn get createdAt => integer().nullable()();
  IntColumn get updatedAt => integer().nullable()();
}
