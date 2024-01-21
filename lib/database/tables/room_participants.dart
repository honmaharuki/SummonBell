import 'package:drift/drift.dart';
import 'package:summon_bell/database/tables/accounts.dart';
import 'package:summon_bell/database/tables/rooms.dart';

@DataClassName('RoomParticipant')
class RoomParticipants extends Table {
  IntColumn get roomId => integer().references(Rooms, #roomId)();
  IntColumn get accountId => integer().references(Accounts, #accountId)();
  IntColumn get createdAt => integer().nullable()();
  IntColumn get updatedAt => integer().nullable()();
}
