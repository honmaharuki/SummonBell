import 'package:drift/drift.dart';

@DataClassName('Message')
class Messages extends Table {
  IntColumn get messageId => integer().autoIncrement()();
  IntColumn get roomId =>
      integer().customConstraint('REFERENCES rooms(room_id)')();
  TextColumn get msg => text()();
  IntColumn get accountId =>
      integer().customConstraint('REFERENCES accounts(account_id)')();
  TextColumn get updatedAt => text()();
}
