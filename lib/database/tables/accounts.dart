import 'package:drift/drift.dart';

@DataClassName('Account')
class Accounts extends Table {
  IntColumn get accountId => integer().autoIncrement()();
  TextColumn get password => text()();
  TextColumn get email => text()();
  TextColumn get loginTokens => text().nullable()();
  TextColumn get status => text().nullable()();
  TextColumn get username => text()();
  TextColumn get accountType => text()();
  IntColumn get createdAt => integer().nullable()();
  IntColumn get updatedAt => integer().nullable()();
}
