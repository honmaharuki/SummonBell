import 'package:drift/drift.dart';

class ToodoaItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 6, max: 32)();
  TextColumn get content => text().named('body')();
  IntColumn get category => integer().nullable().references(Categoriesa, #id)();
}

@DataClassName('Categorya')
class Categoriesa extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
}
