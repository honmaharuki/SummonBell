import 'package:summon_bell/database/database.dart';

class DatabaseProvider {
  static final DatabaseProvider _instance = DatabaseProvider._internal();
  late final AppDatabase database;

  factory DatabaseProvider() {
    return _instance;
  }

  DatabaseProvider._internal() {
    database = AppDatabase();
  }
}
