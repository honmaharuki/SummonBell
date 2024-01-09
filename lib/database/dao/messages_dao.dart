import 'package:drift/drift.dart';
import 'package:summon_bell/database/database.dart';
import 'package:summon_bell/database/tables/messages.dart';

part 'messages_dao.g.dart';

@DriftAccessor(tables: [Messages])
class MessageDao extends DatabaseAccessor<AppDatabase> with _$MessageDaoMixin {
  MessageDao(AppDatabase db) : super(db);

  Future<List<Message>> getAllUsers() => select(messages).get();
}
