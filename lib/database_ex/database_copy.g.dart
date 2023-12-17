// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_copy.dart';

// ignore_for_file: type=lint
class $CategoriesaTable extends Categoriesa
    with TableInfo<$CategoriesaTable, Categorya> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoriesaTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'categoriesa';
  @override
  VerificationContext validateIntegrity(Insertable<Categorya> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Categorya map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Categorya(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $CategoriesaTable createAlias(String alias) {
    return $CategoriesaTable(attachedDatabase, alias);
  }
}

class Categorya extends DataClass implements Insertable<Categorya> {
  final int id;
  final String name;
  const Categorya({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  CategoriesaCompanion toCompanion(bool nullToAbsent) {
    return CategoriesaCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory Categorya.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Categorya(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  Categorya copyWith({int? id, String? name}) => Categorya(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('Categorya(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Categorya && other.id == this.id && other.name == this.name);
}

class CategoriesaCompanion extends UpdateCompanion<Categorya> {
  final Value<int> id;
  final Value<String> name;
  const CategoriesaCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  CategoriesaCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<Categorya> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  CategoriesaCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return CategoriesaCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesaCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $ToodoaItemsTable extends ToodoaItems
    with TableInfo<$ToodoaItemsTable, ToodoaItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ToodoaItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 6, maxTextLength: 32),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'body', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<int> category = GeneratedColumn<int>(
      'category', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES categoriesa (id)'));
  @override
  List<GeneratedColumn> get $columns => [id, title, content, category];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'toodoa_items';
  @override
  VerificationContext validateIntegrity(Insertable<ToodoaItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('body')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['body']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ToodoaItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ToodoaItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}body'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}category']),
    );
  }

  @override
  $ToodoaItemsTable createAlias(String alias) {
    return $ToodoaItemsTable(attachedDatabase, alias);
  }
}

class ToodoaItem extends DataClass implements Insertable<ToodoaItem> {
  final int id;
  final String title;
  final String content;
  final int? category;
  const ToodoaItem(
      {required this.id,
      required this.title,
      required this.content,
      this.category});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['body'] = Variable<String>(content);
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<int>(category);
    }
    return map;
  }

  ToodoaItemsCompanion toCompanion(bool nullToAbsent) {
    return ToodoaItemsCompanion(
      id: Value(id),
      title: Value(title),
      content: Value(content),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
    );
  }

  factory ToodoaItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ToodoaItem(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      content: serializer.fromJson<String>(json['content']),
      category: serializer.fromJson<int?>(json['category']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'content': serializer.toJson<String>(content),
      'category': serializer.toJson<int?>(category),
    };
  }

  ToodoaItem copyWith(
          {int? id,
          String? title,
          String? content,
          Value<int?> category = const Value.absent()}) =>
      ToodoaItem(
        id: id ?? this.id,
        title: title ?? this.title,
        content: content ?? this.content,
        category: category.present ? category.value : this.category,
      );
  @override
  String toString() {
    return (StringBuffer('ToodoaItem(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('category: $category')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, content, category);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ToodoaItem &&
          other.id == this.id &&
          other.title == this.title &&
          other.content == this.content &&
          other.category == this.category);
}

class ToodoaItemsCompanion extends UpdateCompanion<ToodoaItem> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> content;
  final Value<int?> category;
  const ToodoaItemsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.content = const Value.absent(),
    this.category = const Value.absent(),
  });
  ToodoaItemsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String content,
    this.category = const Value.absent(),
  })  : title = Value(title),
        content = Value(content);
  static Insertable<ToodoaItem> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? content,
    Expression<int>? category,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (content != null) 'body': content,
      if (category != null) 'category': category,
    });
  }

  ToodoaItemsCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? content,
      Value<int?>? category}) {
    return ToodoaItemsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      category: category ?? this.category,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (content.present) {
      map['body'] = Variable<String>(content.value);
    }
    if (category.present) {
      map['category'] = Variable<int>(category.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ToodoaItemsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('category: $category')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabasEx extends GeneratedDatabase {
  _$AppDatabasEx(QueryExecutor e) : super(e);
  late final $CategoriesaTable categoriesa = $CategoriesaTable(this);
  late final $ToodoaItemsTable toodoaItems = $ToodoaItemsTable(this);
  late final ToodoaItemsDao toodoaItemsDao =
      ToodoaItemsDao(this as AppDatabasEx);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [categoriesa, toodoaItems];
}
