import 'package:drift/drift.dart';
import 'package:drift/native.dart';

part 'db.g.dart';

// driftfileみてめっちゃ内容変わってる。
@DriftDatabase(
  include: {'tables.drift'},
)
class MyDb extends _$MyDb {
  // This example creates a simple in-memory database (without actual
  // persistence).
  // To store data, see the database setups from other "Getting started" guides.
  MyDb() : super(NativeDatabase.memory());

  @override
  int get schemaVersion => 1;
}
