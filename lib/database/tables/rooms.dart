import 'package:drift/drift.dart';

@DataClassName('Room')
class Rooms extends Table {
  IntColumn get roomId => integer().autoIncrement()();
  TextColumn get topic => text().nullable()();
  TextColumn get name => text()();
  TextColumn get lastMessage => text().nullable()();
  IntColumn get createdAt => integer().nullable()();
  IntColumn get updatedAt => integer().nullable()();
}
