import 'package:drift/drift.dart';
import 'package:summon_bell/database/database_copy.dart' hide Categorya;
import 'package:summon_bell/database/too_do_entry.dart';
import 'package:summon_bell/database/too_do_items.dart';

part 'too_do_items_dao.g.dart';

@DriftAccessor(tables: [ToodoaItems])
class ToodoaItemsDao extends DatabaseAccessor<AppDatabase>
    with _$ToodoaItemsDaoMixin {
  ToodoaItemsDao(AppDatabase db) : super(db);

  Future<List<ToodoaItem>> getAllEntries() => select(toodoaItems).get();
}
