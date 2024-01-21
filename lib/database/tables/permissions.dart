import 'package:drift/drift.dart';

@DataClassName('Permission')
class Permissions extends Table {
  IntColumn get permissionId => integer().autoIncrement()();
  TextColumn get roles => text()();
  TextColumn get level => text()();
  IntColumn get createdAt => integer().nullable()();
  IntColumn get updatedAt => integer().nullable()();
}
