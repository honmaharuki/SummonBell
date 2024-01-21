import 'package:drift/drift.dart';
import 'package:summon_bell/database/database.dart';
import 'package:summon_bell/database/tables/rooms.dart';

part 'rooms_dao.g.dart';

@DriftAccessor(tables: [Rooms])
class RoomDao extends DatabaseAccessor<AppDatabase> with _$RoomDaoMixin {
  RoomDao(AppDatabase db) : super(db);

  Future<List<Room>> getAllUsers() => select(rooms).get();
}
