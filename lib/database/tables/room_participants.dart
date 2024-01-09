import 'package:drift/drift.dart';

@DataClassName('RoomParticipant')
class RoomParticipants extends Table {
  IntColumn get roomId =>
      integer().customConstraint('REFERENCES rooms(room_id)')();
  IntColumn get accountId =>
      integer().customConstraint('REFERENCES accounts(account_id)')();
}
