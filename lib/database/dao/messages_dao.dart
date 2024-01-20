import 'package:drift/drift.dart';
import 'package:summon_bell/database/database.dart';
import 'package:summon_bell/database/tables/accounts.dart';
import 'package:summon_bell/database/tables/messages.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

part 'messages_dao.g.dart';

@DriftAccessor(tables: [Messages, Accounts])
class MessageDao extends DatabaseAccessor<AppDatabase> with _$MessageDaoMixin {
  MessageDao(AppDatabase db) : super(db);

  Future<List<Message>> getAllUsers() => select(messages).get();
  Future<List<Message>> getRoomMessages(int roomId) =>
      (select(messages)..where((m) => m.roomId.equals(roomId))).get();
  //チャットルームで利用するためのメッセージを取得
  Future<List<types.Message>> getRoomMessagesForChat(int roomId) async {
    //NOTE try catchをつけなくても落ちませんが、エラーが出てることに気が付かなくなるのでつけています。
    try {
      final query = select(messages).join([
        leftOuterJoin(
          accounts, accounts.accountId.equalsExp(messages.accountId),
          //MEMO これfalseにしておくとjoinされたカラムは入らなくなります。 useColumns: false)
        )
      ])
        ..where(messages.roomId.equals(roomId))
        ..orderBy([
          OrderingTerm(expression: messages.messageId, mode: OrderingMode.desc)
        ]);
      final rows = await query.get();
      return rows.map((row) {
        /*
        readTableOrNullはnullの場合はnullを返します。
        readTable系はデータがある場合テーブルの値一覧を返します。
        print(row.readTableOrNull(messages));
        */
        return types.TextMessage(
          author: types.User(
              id: row.readTable(accounts).accountId.toString(),
              firstName: row.readTable(accounts).username),
          createdAt: row.readTable(messages).updatedAt,
          id: row.readTable(messages).messageId.toString(),
          text: row.readTable(messages).msg,
        );
      }).toList();
    } catch (e) {
      print(e);
      return [];
    }
  }

  //TODO 引数名直す 登録する値も直す
  Future<void> insertTextMessage(
      int roomId, int accountId, String message, int updatedAt) async {
    await into(messages).insert(MessagesCompanion.insert(
      roomId: roomId,
      accountId: accountId,
      msg: message,
      updatedAt: updatedAt,
    ));
  }
  /* TODO あとで下記やるwatchで自動値出力
   *  Stream<List<TodoItem>> watchEntriesInCategory(Category c) {
    return (select(todos)..where((t) => t.category.equals(c.id))).watch();
  } */
}
