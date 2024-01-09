import 'package:drift/drift.dart';

@DataClassName('Permission')
class Permissions extends Table {
  IntColumn get permissionId => integer().autoIncrement()();
  TextColumn get updatedAt => text()();
  TextColumn get roles => text()();
  TextColumn get level => text()();
}
