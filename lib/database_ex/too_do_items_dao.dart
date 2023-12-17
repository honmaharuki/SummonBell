import 'package:drift/drift.dart';
import 'package:summon_bell/database_ex/database_copy.dart' hide Categorya;
import 'package:summon_bell/database_ex/too_do_entry.dart';
import 'package:summon_bell/database_ex/too_do_items.dart';
import 'package:summon_bell/database_ex/database_copy.dart';

part 'too_do_items_dao.g.dart';

@DriftAccessor(tables: [ToodoaItems])
class ToodoaItemsDao extends DatabaseAccessor<AppDatabasEx>
    with _$ToodoaItemsDaoMixin {
  ToodoaItemsDao(AppDatabasEx db) : super(db);

  Future<List<ToodoaItem>> getAllEntries() => select(toodoaItems).get();
}
