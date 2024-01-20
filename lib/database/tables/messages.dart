import 'package:drift/drift.dart';
import 'package:summon_bell/database/tables/accounts.dart';
import 'package:summon_bell/database/tables/rooms.dart';

@DataClassName('Message')
class Messages extends Table {
  IntColumn get messageId => integer().autoIncrement()();
  IntColumn get roomId => integer().references(Rooms, #roomId)();
  TextColumn get msg => text()();
  IntColumn get accountId => integer().references(Accounts, #accountId)();
  IntColumn get updatedAt => integer()();
}
