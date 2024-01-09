import 'package:drift/drift.dart';
import 'package:summon_bell/database/database.dart';
import 'package:summon_bell/database/tables/room_participants.dart';

part 'room_participants_dao.g.dart';

@DriftAccessor(tables: [RoomParticipants])
class RoomParticipantDao extends DatabaseAccessor<AppDatabase>
    with _$RoomParticipantDaoMixin {
  RoomParticipantDao(AppDatabase db) : super(db);

  Future<List<RoomParticipant>> getAllUsers() => select(roomParticipants).get();
}
