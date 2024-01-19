# flutterライブラリ driftの使い方

## driftとは

driftは、Flutterアプリケーションでのデータベース操作を容易にするためのライブラリです。以下の手順に従って、driftを使う方法を説明します。

1. プロジェクトにdriftを追加する
2. データベースの作成と設定
3. テーブルとモデルの作成
4. クエリの実行とデータの操作
5. driftの高度な機能の活用

## drift で作られるクラス
- Data Classes（データクラス）
  - テーブルの各行（レコード）を表し、アプリケーション内でデータを操作する際に使用されます。
  - Userの場合UserData、Usersの場合Userとなる。
- Companion Classes
  - データベースへの挿入や更新に使用されます。
- など


### 1. プロジェクトにdriftを追加する

まず、Flutterプロジェクトにdriftを追加します。pubspec.yamlファイルに以下の依存関係を追加します。また、関連するパッケージが複数あるのでそれらもインストールします。
```yaml
dependencies:
  drift: ^1.5.0
  path: ^1.8.0
  path_provider: ^2.0.9
  sqlite3_flutter_libs: ^0.5.5

dev_dependencies:
  build_runner: ^2.1.8
  drift_dev: ^1.5.2
```

その後、ターミナルで以下のコマンドを実行して、driftをインストールします。

```bash
flutter pub get
```

ベースの作成

todos.dartを作成し下記記載

``` dart
import 'package:drift/drift.dart';

/*‘ファイル名.g.dart’の形で記載します。
今回の場合ファイル名が’todos.dart’のため、’todos.g.dart’となります。
この部分はエラーとなりますが、ファイルの自動生成によりエラーは消えるため、
無視して構いません。
*/
part 'todos.g.dart';

/*
データベースのテーブルを定義します。
今回の場合、Todosというクラス名のため、todosというテーブルが作成され、
列としてidとcontentを持っている、という形になります。
また一行一行が、Todoというデータクラスで保持されます。
（クラス名からsを取った形でデータクラスが自動生成されます）

autoIncrement()を設定しておくと、データ追加時にidを自動で生成してくれます。
*/
class Todos extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get content => text()();
}

/*
データベースクラスの定義です。
ここに、データベースの生成処理やデータの追加等の処理を後ほど記載していきます。

@DriftDatabase(tables: [テーブルクラス名])
とアノテーションを追加することで、データベースにテーブルが紐付けられます。
*/
@DriftDatabase(tables: [Todos])
class MyDatabase extends _$MyDatabase {}
```

コードの自動生成 ---------------------------  
これでテーブル関連処理が作成される。
@DriftDatabase()で指定したテーブルクラスが作成される。

``` dart
flutter pub run build_runner build
```

これで、todos.g.dartが生成される。

dBの作成

作成したデータベースとアプリケーションのつなぎ込み
1. アプリを立ち上げたときにデータベースを生成する処理
下記コード
``` dart
import 'dart:io';  //追加

import 'package:drift/drift.dart';
import 'package:drift/native.dart';  //追加
import 'package:path/path.dart' as p;  //追加
import 'package:path_provider/path_provider.dart';  //追加

part 'todos.g.dart';

class Todos extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get content => text()();
}

@DriftDatabase(tables: [Todos])
class MyDatabase extends _$MyDatabase {
  //データベースのインスタンス生成と同時にデータベースとの接続処理を行います。
  // インスタンスとは、クラスを元に作られたオブジェクトのことです。
  MyDatabase() : super(_openConnection());  //追加

  //データベースのバージョン指定部分です。
  @override  //追加
  int get schemaVersion => 1; //追加
}

//このメソッドでデータベースの保存位置を取得し設定することを行っています。
//以下追加
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}

```

データベースの生成は、main.dartのmain関数の中で、runAppの前で行います。  
（リバーポッド使えばその限りではないです。  
https://github.com/simolus3/drift/blob/develop/examples/app/lib/database/database.dart）
main.dart
``` dart
import 'package:drift_sample2/src/drift/todos.dart';  //追加
import 'package:flutter/material.dart';

void main() {
  final database = MyDatabase(); //追加
  runApp(const MyApp());
}

//以下省略
```



## CURD操作
### 検索データの表示
データベースのデータの取得は以下の2種類があります。

Streamでデータを監視する
Futureでデータを一気に取得する

todos.dartのMyDatabaseクラス内に上記2種類の方法を記載します。

``` dart
@DriftDatabase(tables: [Todos])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
  /*
  Streamでのデータ取得のコードです。
  selectでテーブルを選択し、
  watchでデータクラスであるTodoのリストをStreamで返します。
  */
  //以下追記
  Stream<List<Todo>> watchEntries() {
    return (select(todos)).watch();
  }

    /*
    データが更新されるたびに取得されるらしい。 
    */
  Stream<List<Employee>> watchEntriesInCategory(Category c) {
    return (select(employee)..where((t) => t.category.equals(c.id))).watch();
  }
  /*
  Futureでのデータ取得のコードです。
  上と同様、selectでテーブルを選択し、getでデータを取得します。
  */
  //以下追記
  Future<List<Todo>> get allTodoEntries => select(todos).get();

    // where句を使って、条件を指定することも可能です。
  Future<Employee> get employeeData => select(employee).where((t) => t.name.equals("john Doe")).getSingle();

  // limit
    Future<List<Employee>> limitEmployee(int limit, {int offset}) {
      return (select(employee)..limit(limit, offset: offset)).get();
    }

    // order by
    Future<List<Employee>> sortEntriesAlphabetically() {
      return (select(employee)..orderBy([(t) => OrderingTerm(expression: t.name)])).get();
    }
}
```

例ではデータの追加等を監視し続けたいため、
Streamのメソッドを用いて、StreamBuilderにてデータの反映を行います。

``` dart
import 'src/drift/todos.dart';
import 'package:flutter/material.dart';

void main() {
  final database = MyDatabase();
  //9
  runApp(MyApp(database: database));  //変更
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.database,  //追加
  }) : super(key: key);

  final MyDatabase database;  //追加

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DriftSample(database: database),//変更
    );
  }
}

class DriftSample extends StatelessWidget {
  const DriftSample({
    Key? key,
    required this.database,  //追加
  }) : super(key: key);

  final MyDatabase database;  //追加

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              /*StreamBuilderの記述部分です。
                database.watchEntriesメソッドによりデータの取得を行います。
              */
              //以下、Container()をStreamBuilder(...)に置き換え
              child: StreamBuilder(
                stream: database.watchEntries(),
                builder:
                    (BuildContext context, AsyncSnapshot<List<Todo>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return ListView.builder(
                    /*
                        snapshot.dataにはList<Todo>の型のデータが入っているので、
                        これを使ってデータを表示します。
                    */
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) => TextButton(
                      child: Text(snapshot.data![index].content),
                      onPressed: () async {
                      },
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: ElevatedButton(
                      child: const Text('Add'),
                      onPressed: () async {
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: ElevatedButton(
                      child: const Text('remove'),
                      onPressed: () async {
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

```

### データの追加 Insert

``` dart
@DriftDatabase(tables: [Todos])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Stream<List<Todo>> watchEntries() {
    return (select(todos)).watch();
  }

  Future<List<Todo>> get allTodoEntries => select(todos).get();
  /*
    データの追加メソッドです。
    intoでデータを追加するテーブルを指定し、
    insertでデータクラスであるTodosCompanionを追加します。
    TodosCompanionはデータの挿入や更新に有用なデータクラスです。
    このデータクラスを使うことにより、
    idを指定せずにデータを追加したい時など、一部のデータだけ追加することができます。
  */
  //以下追加
  Future<int> addTodo(String content) {
    return into(todos).insert(TodosCompanion(content: Value(content)));
  }

  // returns the generated id 丸ごとでもOK
    Future<int> addEmployee(EmployeeCompanion entry) {
      return into(employee).insert(entry);
    }

    // まとめて追加も可能 型とList<Companion>となる
    Future<void> insertMultipleEntries() async {
        await batch((batch) {
            // バッチ内での操作は即時実行されず、バッチが完了するまで待機されます。
            batch.insertAll(employee, [listOfEmployees]);
        });
    }
}
```

### データの更新
``` dart
@DriftDatabase(tables: [Todos])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Stream<List<Todo>> watchEntries() {
    return (select(todos)).watch();
  }

  Future<List<Todo>> get allTodoEntries => select(todos).get();

  Future<int> addTodo(String content) {
    return into(todos).insert(TodosCompanion(content: Value(content)));
  }

/*
    データ更新のメソッドです。
    update(todos)でテーブルを指定し、
    where以下で引数のTodo インスタンスとidが一致する物を探します。
    探索で見つかった行を、write で上書きする、といった流れのメソッドとなります。
*/
//以下追加
  Future<int> updateTodo(Todo todo, String content) {
    return (update(todos)..where((tbl) => tbl.id.equals(todo.id))).write(
      TodosCompanion(
        content: Value(content),
      ),
    );
  }

    // where句を使って、条件を指定することも可能です。
    // 以下の例では、nameが"John Doe"の行を探し、postを"Assistant Manager"に更新しています。
    // この場合、nameが"John Doe"の行が複数ある場合は、全ての行が更新されます。
  Future updateEmployeePost() {
  return (update(employee)
        ..where((t) => t.name.equals("John Doe"))
      ).write(EmployeeCompanion(
        post: Value("Assistant Manager"),
      ),
    );
    }

    // プライマリーキー以外のすべてのフィールドが更新されます。これにより、同じプライマリーキーを持つエントリだけが更新されることが保証されます。
    /*
    例えば、employeeDataオブジェクトがプライマリーキーとしてIDが5の従業員のデータを含んでいる場合、update(employee).replace(employeeData)はIDが5の従業員のレコードのみを更新します。employeeDataに含まれる名前、住所、役職などのフィールドでそのレコードが更新されます。*/
    Future updateEmployee(Employee employeeData) {
       return update(employee).replace(employeeData);
    }
}
```
### データの削除
``` dart
@DriftDatabase(tables: [Todos])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Stream<List<Todo>> watchEntries() {
    return (select(todos)).watch();
  }

  Future<List<Todo>> get allTodoEntries => select(todos).get();

  Future<int> addTodo(String content) {
    return into(todos).insert(TodosCompanion(content: Value(content)));
  }

  Future<int> updateTodo(Todo todo, String content) {
    return (update(todos)..where((tbl) => tbl.id.equals(todo.id))).write(
      TodosCompanion(
        content: Value(content),
      ),
    );
  }
/*
データ削除のメソッドです。
delete(todos)でテーブルを指定し、
where以下で引数のTodo インスタンスとidが一致する物を探します。
探索で見つかった行を、go で削除実行する、といった流れのメソッドとなります。

whereつけないと全レコードが消えます。
*/
//以下追加
  Future<void> deleteTodo(Todo todo) {
    return (delete(todos)..where((tbl) => tbl.id.equals(todo.id))).go();
  }
}
```

### 高度なクエリ join

まず、EmployeesInfo という新しいテーブルを作成します。このテーブルは employee テーブルと結合するために使用されます。

``` dart
Copy code
class EmployeesInfo extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get employeeId => text().nullable()();
  IntColumn get contact => text().nullable()();
  TextColumn get adress => integer().nullable()();
}
```

クエリの例：employeeWithInfo
``` dart
Future<List<Employee>> employeeWithInfo() async {
  final query = select(employee).join([
    leftJoin(employeesInfo, employeesInfo.employeeId.equals(employee.id),
        useColumns: false)
  ])
  ..where(employee.salary.isSmallerOrEqual(80000));

  return query.map((row) => row.readTable(employeesInfo)).get();
}
```
1. 結合の定義: employee テーブルと EmployeesInfo テーブルを左外部結合します。結合条件は employeesInfo.employeeId.equals(employee.id) です。
2. 条件の追加: where 句を使って、給料が80,000以下の従業員をフィルタリングします。
3. クエリの実行と結果のマッピング: get() メソッドを使用してクエリを実行し、結果を Employee オブジェクトにマッピングします。


クエリの読み取り
``` dart
return query.map((rows) {
  return rows.map((row) {
    return EmployeeWithInfo(
      row.readTable(employee),
      row.readTableOrNull(employeesInfo),
    );
  }).toList();
});
```
1. 各行（TypedResult）からデータを読み取ることができます。readTable メソッドを使って employee テーブルからデータを読み取り、readTableOrNull メソッドを使って EmployeesInfo テーブルからデータを読み取ります。
2. readTable は、テーブルが行に存在しない場合に ArgumentError をスローします。このため、存在しない可能性があるデータには readTableOrNull を使用します。


下記からは別記事の内容
-----------------------
https://qiita.com/team7_403_poppin/items/b6eb8a15ef716834f2e5

### 1. 初期ファイル

まず、以下のようなファイルを作成します。

```dart
import 'package:drift/drift.dart';

// このファイルの名前が"database.dart"の場合は以下の名前で定義しておく。
// このタイミングだとファイルが存在しないためエラーが出るが、後の工程で自動作成される。
part 'database.g.dart';

// 以下の定義の場合だと"todos"というテーブルが作成される。
// 行単位のデータは"Todoクラス"になる。
// 　※Todoクラスはこの後の工程で自動で作成される。
class Todos extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 6, max: 32)();
  TextColumn get content => text().named('body')();
  IntColumn get category => integer().nullable()();
}

// Driftでは行単位のデータを扱うクラスを作成するときはテーブルクラスに"s"がある場合"s"を除いたものを作成するため、
// 単数形と複数形で形が異なる場合は"DataClassName"で単数形の名称を定義する必要がある。
// DataNameClassを定義しない場合は"Categorie"になってしまう。
// 
// 最後がsじゃない場合には気にしなくて問題ない。
// ただしDaoで使う場合DataClassを引き継いだクラスを用いることになる。
// Userの場合には、class UserData extends DataClassで、Userを使うことになる。
// Usersの場合にはUserになる。
@DataClassName('Category')
class Categories extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get description => text()();
}

// DriftDatabaseに上記の2テーブルを指定して、Driftで扱えるよう設定する。
// 今のタイミングではMyDatabeseクラスは空で良い。
// "_$MyDatabase"が存在しないと怒られるが気にしない。
@DriftDatabase(tables: [Todos, Categories])
class MyDatabase extends _$MyDatabase {
}

```

ビルド後MyDatebase Classに追記と、インポート追加、設定

```dart
    // 初期設定を定義するために以下のインポートを追加
import 'dart:io';

import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

@DriftDatabase(tables: [Todos, Categories])
class MyDatabase extends _$MyDatabase {
  // コンストラクタでDBの保存先を定義する
  MyDatabase() : super(_openConnection());

  // マイグレーションを行う場合に使用ため、テーブルを追加／変更／削除する場合はこの値をインクリメントする
  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // PCの場合はドキュメントフォルダに"db.sqlite"が作成される
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}

```

利用法

main.dart

```dart
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
+  Future<void> _testDrift() async {
+    final database = MyDatabase();
+    // Simple insert:
+    await database
+        .into(database.categories)
+        .insert(CategoriesCompanion.insert(description: 'my first category'));
+
+    // Simple select:
+    final allCategories = await database.select(database.categories).get();
+    print('Categories in database: $allCategories');
+  }
//  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      floatingActionButton: FloatingActionButton(
-        onPressed: _incrementCounter,
+        onPressed: _testDrift,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
}
```

TodosとCategoriesをForeignKeyでつなぐ方法

```dart
class Todos extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 6, max: 32)();
  TextColumn get content => text().named('body')();
- IntColumn get category => integer().nullable()();
+ // categoyにForeignKeyを設定
+ IntColumn get category => integer().nullable().references(Categories, #id)();
}

@DriftDatabase(tables: [Movies, WatchLists], daos: [MoviesDao, WatchListsDao])
class MyDatabase extends _$MyDatabase {

+@override
+  MigrationStrategy get migration {
+    return MigrationStrategy(
+        onCreate: (Migrator m) async {
+          await m.createAll();
+        },
+        onUpgrade: (Migrator m, int from, int to) async {},
+        beforeOpen: (details) async {
+          if (details.wasCreated) {
+            // ...
+          }
+          // デフォルトではForeignKeyの設定がOFFになっているためONにする
+          await customStatement('PRAGMA foreign_keys = ON');
+        });
+  }
}
```

## プラスアルファ
### 直SQL
dartファイルに直書きもできるが、driftファイルを使うことでSQL直書きもできる。

drift
```drift
CREATE TABLE todos (
    id INT NOT NULL PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    category INTEGER REFERENCES categories(id)
);

CREATE TABLE categories (
    id INT NOT NULL PRIMARY KEY AUTOINCREMENT,
    description TEXT NOT NULL
) AS Category; -- the AS xyz after the table defines the data class name

-- You can also create an index or triggers with drift files
CREATE INDEX categories_description ON categories(description);

-- 検索処理とかかけるんよ:
createEntry: INSERT INTO todos (title, content) VALUES (:title, :content);
deleteById: DELETE FROM todos WHERE id = :id;
allTodos: SELECT * FROM todos;
```

driftファイルを使うときには
```dart



### 参考資料
- https://fluttertalk.com/flutter-crud-tutorial-using-drift-package/#:~:text=,their%20significance%20in%20app%20development
- https://chegebrian.medium.com/testing-drift-database-in-flutter-978c3eb620dd