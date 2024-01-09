import 'package:drift/drift.dart';

@DataClassName('UserCharacter')
class UserCharacters extends Table {
  IntColumn get accountId =>
      integer().customConstraint('REFERENCES accounts(account_id)')();
  IntColumn get characterAccountId =>
      integer().customConstraint('REFERENCES accounts(account_id)')();
  IntColumn get index => integer()();
}
