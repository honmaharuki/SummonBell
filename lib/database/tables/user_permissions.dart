import 'package:drift/drift.dart';

@DataClassName('UserPermission')
class UserPermissions extends Table {
  IntColumn get accountId =>
      integer().customConstraint('REFERENCES accounts(account_id)')();
  IntColumn get permissionId =>
      integer().customConstraint('REFERENCES permissions(permission_id)')();
}
