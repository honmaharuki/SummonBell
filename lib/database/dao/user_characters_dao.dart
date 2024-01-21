import 'package:drift/drift.dart';
import 'package:summon_bell/database/database.dart';
import 'package:summon_bell/database/tables/user_characters.dart';

part 'user_characters_dao.g.dart';

@DriftAccessor(tables: [UserCharacters])
class UserCharacterDao extends DatabaseAccessor<AppDatabase>
    with _$UserCharacterDaoMixin {
  UserCharacterDao(AppDatabase db) : super(db);

  Future<List<UserCharacter>> getAllUserCharacters() =>
      select(userCharacters).get();
}
