// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $AccountsTable extends Accounts with TableInfo<$AccountsTable, Account> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AccountsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _accountIdMeta =
      const VerificationMeta('accountId');
  @override
  late final GeneratedColumn<int> accountId = GeneratedColumn<int>(
      'account_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
      'created_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _passwordMeta =
      const VerificationMeta('password');
  @override
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
      'password', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _loginTokensMeta =
      const VerificationMeta('loginTokens');
  @override
  late final GeneratedColumn<String> loginTokens = GeneratedColumn<String>(
      'login_tokens', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _usernameMeta =
      const VerificationMeta('username');
  @override
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
      'username', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _accountTypeMeta =
      const VerificationMeta('accountType');
  @override
  late final GeneratedColumn<String> accountType = GeneratedColumn<String>(
      'account_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        accountId,
        createdAt,
        password,
        email,
        loginTokens,
        status,
        updatedAt,
        username,
        accountType
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'accounts';
  @override
  VerificationContext validateIntegrity(Insertable<Account> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('account_id')) {
      context.handle(_accountIdMeta,
          accountId.isAcceptableOrUnknown(data['account_id']!, _accountIdMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('password')) {
      context.handle(_passwordMeta,
          password.isAcceptableOrUnknown(data['password']!, _passwordMeta));
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('login_tokens')) {
      context.handle(
          _loginTokensMeta,
          loginTokens.isAcceptableOrUnknown(
              data['login_tokens']!, _loginTokensMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('username')) {
      context.handle(_usernameMeta,
          username.isAcceptableOrUnknown(data['username']!, _usernameMeta));
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('account_type')) {
      context.handle(
          _accountTypeMeta,
          accountType.isAcceptableOrUnknown(
              data['account_type']!, _accountTypeMeta));
    } else if (isInserting) {
      context.missing(_accountTypeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {accountId};
  @override
  Account map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Account(
      accountId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}account_id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_at'])!,
      password: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}password'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      loginTokens: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}login_tokens']),
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status']),
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}updated_at'])!,
      username: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}username'])!,
      accountType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}account_type'])!,
    );
  }

  @override
  $AccountsTable createAlias(String alias) {
    return $AccountsTable(attachedDatabase, alias);
  }
}

class Account extends DataClass implements Insertable<Account> {
  final int accountId;
  final String createdAt;
  final String password;
  final String email;
  final String? loginTokens;
  final String? status;
  final String updatedAt;
  final String username;
  final String accountType;
  const Account(
      {required this.accountId,
      required this.createdAt,
      required this.password,
      required this.email,
      this.loginTokens,
      this.status,
      required this.updatedAt,
      required this.username,
      required this.accountType});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['account_id'] = Variable<int>(accountId);
    map['created_at'] = Variable<String>(createdAt);
    map['password'] = Variable<String>(password);
    map['email'] = Variable<String>(email);
    if (!nullToAbsent || loginTokens != null) {
      map['login_tokens'] = Variable<String>(loginTokens);
    }
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<String>(status);
    }
    map['updated_at'] = Variable<String>(updatedAt);
    map['username'] = Variable<String>(username);
    map['account_type'] = Variable<String>(accountType);
    return map;
  }

  AccountsCompanion toCompanion(bool nullToAbsent) {
    return AccountsCompanion(
      accountId: Value(accountId),
      createdAt: Value(createdAt),
      password: Value(password),
      email: Value(email),
      loginTokens: loginTokens == null && nullToAbsent
          ? const Value.absent()
          : Value(loginTokens),
      status:
          status == null && nullToAbsent ? const Value.absent() : Value(status),
      updatedAt: Value(updatedAt),
      username: Value(username),
      accountType: Value(accountType),
    );
  }

  factory Account.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Account(
      accountId: serializer.fromJson<int>(json['accountId']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
      password: serializer.fromJson<String>(json['password']),
      email: serializer.fromJson<String>(json['email']),
      loginTokens: serializer.fromJson<String?>(json['loginTokens']),
      status: serializer.fromJson<String?>(json['status']),
      updatedAt: serializer.fromJson<String>(json['updatedAt']),
      username: serializer.fromJson<String>(json['username']),
      accountType: serializer.fromJson<String>(json['accountType']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'accountId': serializer.toJson<int>(accountId),
      'createdAt': serializer.toJson<String>(createdAt),
      'password': serializer.toJson<String>(password),
      'email': serializer.toJson<String>(email),
      'loginTokens': serializer.toJson<String?>(loginTokens),
      'status': serializer.toJson<String?>(status),
      'updatedAt': serializer.toJson<String>(updatedAt),
      'username': serializer.toJson<String>(username),
      'accountType': serializer.toJson<String>(accountType),
    };
  }

  Account copyWith(
          {int? accountId,
          String? createdAt,
          String? password,
          String? email,
          Value<String?> loginTokens = const Value.absent(),
          Value<String?> status = const Value.absent(),
          String? updatedAt,
          String? username,
          String? accountType}) =>
      Account(
        accountId: accountId ?? this.accountId,
        createdAt: createdAt ?? this.createdAt,
        password: password ?? this.password,
        email: email ?? this.email,
        loginTokens: loginTokens.present ? loginTokens.value : this.loginTokens,
        status: status.present ? status.value : this.status,
        updatedAt: updatedAt ?? this.updatedAt,
        username: username ?? this.username,
        accountType: accountType ?? this.accountType,
      );
  @override
  String toString() {
    return (StringBuffer('Account(')
          ..write('accountId: $accountId, ')
          ..write('createdAt: $createdAt, ')
          ..write('password: $password, ')
          ..write('email: $email, ')
          ..write('loginTokens: $loginTokens, ')
          ..write('status: $status, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('username: $username, ')
          ..write('accountType: $accountType')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(accountId, createdAt, password, email,
      loginTokens, status, updatedAt, username, accountType);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Account &&
          other.accountId == this.accountId &&
          other.createdAt == this.createdAt &&
          other.password == this.password &&
          other.email == this.email &&
          other.loginTokens == this.loginTokens &&
          other.status == this.status &&
          other.updatedAt == this.updatedAt &&
          other.username == this.username &&
          other.accountType == this.accountType);
}

class AccountsCompanion extends UpdateCompanion<Account> {
  final Value<int> accountId;
  final Value<String> createdAt;
  final Value<String> password;
  final Value<String> email;
  final Value<String?> loginTokens;
  final Value<String?> status;
  final Value<String> updatedAt;
  final Value<String> username;
  final Value<String> accountType;
  const AccountsCompanion({
    this.accountId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.password = const Value.absent(),
    this.email = const Value.absent(),
    this.loginTokens = const Value.absent(),
    this.status = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.username = const Value.absent(),
    this.accountType = const Value.absent(),
  });
  AccountsCompanion.insert({
    this.accountId = const Value.absent(),
    required String createdAt,
    required String password,
    required String email,
    this.loginTokens = const Value.absent(),
    this.status = const Value.absent(),
    required String updatedAt,
    required String username,
    required String accountType,
  })  : createdAt = Value(createdAt),
        password = Value(password),
        email = Value(email),
        updatedAt = Value(updatedAt),
        username = Value(username),
        accountType = Value(accountType);
  static Insertable<Account> custom({
    Expression<int>? accountId,
    Expression<String>? createdAt,
    Expression<String>? password,
    Expression<String>? email,
    Expression<String>? loginTokens,
    Expression<String>? status,
    Expression<String>? updatedAt,
    Expression<String>? username,
    Expression<String>? accountType,
  }) {
    return RawValuesInsertable({
      if (accountId != null) 'account_id': accountId,
      if (createdAt != null) 'created_at': createdAt,
      if (password != null) 'password': password,
      if (email != null) 'email': email,
      if (loginTokens != null) 'login_tokens': loginTokens,
      if (status != null) 'status': status,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (username != null) 'username': username,
      if (accountType != null) 'account_type': accountType,
    });
  }

  AccountsCompanion copyWith(
      {Value<int>? accountId,
      Value<String>? createdAt,
      Value<String>? password,
      Value<String>? email,
      Value<String?>? loginTokens,
      Value<String?>? status,
      Value<String>? updatedAt,
      Value<String>? username,
      Value<String>? accountType}) {
    return AccountsCompanion(
      accountId: accountId ?? this.accountId,
      createdAt: createdAt ?? this.createdAt,
      password: password ?? this.password,
      email: email ?? this.email,
      loginTokens: loginTokens ?? this.loginTokens,
      status: status ?? this.status,
      updatedAt: updatedAt ?? this.updatedAt,
      username: username ?? this.username,
      accountType: accountType ?? this.accountType,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (accountId.present) {
      map['account_id'] = Variable<int>(accountId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (loginTokens.present) {
      map['login_tokens'] = Variable<String>(loginTokens.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (accountType.present) {
      map['account_type'] = Variable<String>(accountType.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AccountsCompanion(')
          ..write('accountId: $accountId, ')
          ..write('createdAt: $createdAt, ')
          ..write('password: $password, ')
          ..write('email: $email, ')
          ..write('loginTokens: $loginTokens, ')
          ..write('status: $status, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('username: $username, ')
          ..write('accountType: $accountType')
          ..write(')'))
        .toString();
  }
}

class $MessagesTable extends Messages with TableInfo<$MessagesTable, Message> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MessagesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _messageIdMeta =
      const VerificationMeta('messageId');
  @override
  late final GeneratedColumn<int> messageId = GeneratedColumn<int>(
      'message_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _roomIdMeta = const VerificationMeta('roomId');
  @override
  late final GeneratedColumn<int> roomId = GeneratedColumn<int>(
      'room_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES rooms(room_id)');
  static const VerificationMeta _msgMeta = const VerificationMeta('msg');
  @override
  late final GeneratedColumn<String> msg = GeneratedColumn<String>(
      'msg', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _accountIdMeta =
      const VerificationMeta('accountId');
  @override
  late final GeneratedColumn<int> accountId = GeneratedColumn<int>(
      'account_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES accounts(account_id)');
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [messageId, roomId, msg, accountId, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'messages';
  @override
  VerificationContext validateIntegrity(Insertable<Message> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('message_id')) {
      context.handle(_messageIdMeta,
          messageId.isAcceptableOrUnknown(data['message_id']!, _messageIdMeta));
    }
    if (data.containsKey('room_id')) {
      context.handle(_roomIdMeta,
          roomId.isAcceptableOrUnknown(data['room_id']!, _roomIdMeta));
    } else if (isInserting) {
      context.missing(_roomIdMeta);
    }
    if (data.containsKey('msg')) {
      context.handle(
          _msgMeta, msg.isAcceptableOrUnknown(data['msg']!, _msgMeta));
    } else if (isInserting) {
      context.missing(_msgMeta);
    }
    if (data.containsKey('account_id')) {
      context.handle(_accountIdMeta,
          accountId.isAcceptableOrUnknown(data['account_id']!, _accountIdMeta));
    } else if (isInserting) {
      context.missing(_accountIdMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {messageId};
  @override
  Message map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Message(
      messageId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}message_id'])!,
      roomId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}room_id'])!,
      msg: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}msg'])!,
      accountId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}account_id'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $MessagesTable createAlias(String alias) {
    return $MessagesTable(attachedDatabase, alias);
  }
}

class Message extends DataClass implements Insertable<Message> {
  final int messageId;
  final int roomId;
  final String msg;
  final int accountId;
  final String updatedAt;
  const Message(
      {required this.messageId,
      required this.roomId,
      required this.msg,
      required this.accountId,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['message_id'] = Variable<int>(messageId);
    map['room_id'] = Variable<int>(roomId);
    map['msg'] = Variable<String>(msg);
    map['account_id'] = Variable<int>(accountId);
    map['updated_at'] = Variable<String>(updatedAt);
    return map;
  }

  MessagesCompanion toCompanion(bool nullToAbsent) {
    return MessagesCompanion(
      messageId: Value(messageId),
      roomId: Value(roomId),
      msg: Value(msg),
      accountId: Value(accountId),
      updatedAt: Value(updatedAt),
    );
  }

  factory Message.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Message(
      messageId: serializer.fromJson<int>(json['messageId']),
      roomId: serializer.fromJson<int>(json['roomId']),
      msg: serializer.fromJson<String>(json['msg']),
      accountId: serializer.fromJson<int>(json['accountId']),
      updatedAt: serializer.fromJson<String>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'messageId': serializer.toJson<int>(messageId),
      'roomId': serializer.toJson<int>(roomId),
      'msg': serializer.toJson<String>(msg),
      'accountId': serializer.toJson<int>(accountId),
      'updatedAt': serializer.toJson<String>(updatedAt),
    };
  }

  Message copyWith(
          {int? messageId,
          int? roomId,
          String? msg,
          int? accountId,
          String? updatedAt}) =>
      Message(
        messageId: messageId ?? this.messageId,
        roomId: roomId ?? this.roomId,
        msg: msg ?? this.msg,
        accountId: accountId ?? this.accountId,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('Message(')
          ..write('messageId: $messageId, ')
          ..write('roomId: $roomId, ')
          ..write('msg: $msg, ')
          ..write('accountId: $accountId, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(messageId, roomId, msg, accountId, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Message &&
          other.messageId == this.messageId &&
          other.roomId == this.roomId &&
          other.msg == this.msg &&
          other.accountId == this.accountId &&
          other.updatedAt == this.updatedAt);
}

class MessagesCompanion extends UpdateCompanion<Message> {
  final Value<int> messageId;
  final Value<int> roomId;
  final Value<String> msg;
  final Value<int> accountId;
  final Value<String> updatedAt;
  const MessagesCompanion({
    this.messageId = const Value.absent(),
    this.roomId = const Value.absent(),
    this.msg = const Value.absent(),
    this.accountId = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  MessagesCompanion.insert({
    this.messageId = const Value.absent(),
    required int roomId,
    required String msg,
    required int accountId,
    required String updatedAt,
  })  : roomId = Value(roomId),
        msg = Value(msg),
        accountId = Value(accountId),
        updatedAt = Value(updatedAt);
  static Insertable<Message> custom({
    Expression<int>? messageId,
    Expression<int>? roomId,
    Expression<String>? msg,
    Expression<int>? accountId,
    Expression<String>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (messageId != null) 'message_id': messageId,
      if (roomId != null) 'room_id': roomId,
      if (msg != null) 'msg': msg,
      if (accountId != null) 'account_id': accountId,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  MessagesCompanion copyWith(
      {Value<int>? messageId,
      Value<int>? roomId,
      Value<String>? msg,
      Value<int>? accountId,
      Value<String>? updatedAt}) {
    return MessagesCompanion(
      messageId: messageId ?? this.messageId,
      roomId: roomId ?? this.roomId,
      msg: msg ?? this.msg,
      accountId: accountId ?? this.accountId,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (messageId.present) {
      map['message_id'] = Variable<int>(messageId.value);
    }
    if (roomId.present) {
      map['room_id'] = Variable<int>(roomId.value);
    }
    if (msg.present) {
      map['msg'] = Variable<String>(msg.value);
    }
    if (accountId.present) {
      map['account_id'] = Variable<int>(accountId.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MessagesCompanion(')
          ..write('messageId: $messageId, ')
          ..write('roomId: $roomId, ')
          ..write('msg: $msg, ')
          ..write('accountId: $accountId, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $PermissionsTable extends Permissions
    with TableInfo<$PermissionsTable, Permission> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PermissionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _permissionIdMeta =
      const VerificationMeta('permissionId');
  @override
  late final GeneratedColumn<int> permissionId = GeneratedColumn<int>(
      'permission_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _rolesMeta = const VerificationMeta('roles');
  @override
  late final GeneratedColumn<String> roles = GeneratedColumn<String>(
      'roles', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _levelMeta = const VerificationMeta('level');
  @override
  late final GeneratedColumn<String> level = GeneratedColumn<String>(
      'level', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [permissionId, updatedAt, roles, level];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'permissions';
  @override
  VerificationContext validateIntegrity(Insertable<Permission> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('permission_id')) {
      context.handle(
          _permissionIdMeta,
          permissionId.isAcceptableOrUnknown(
              data['permission_id']!, _permissionIdMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('roles')) {
      context.handle(
          _rolesMeta, roles.isAcceptableOrUnknown(data['roles']!, _rolesMeta));
    } else if (isInserting) {
      context.missing(_rolesMeta);
    }
    if (data.containsKey('level')) {
      context.handle(
          _levelMeta, level.isAcceptableOrUnknown(data['level']!, _levelMeta));
    } else if (isInserting) {
      context.missing(_levelMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {permissionId};
  @override
  Permission map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Permission(
      permissionId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}permission_id'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}updated_at'])!,
      roles: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}roles'])!,
      level: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}level'])!,
    );
  }

  @override
  $PermissionsTable createAlias(String alias) {
    return $PermissionsTable(attachedDatabase, alias);
  }
}

class Permission extends DataClass implements Insertable<Permission> {
  final int permissionId;
  final String updatedAt;
  final String roles;
  final String level;
  const Permission(
      {required this.permissionId,
      required this.updatedAt,
      required this.roles,
      required this.level});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['permission_id'] = Variable<int>(permissionId);
    map['updated_at'] = Variable<String>(updatedAt);
    map['roles'] = Variable<String>(roles);
    map['level'] = Variable<String>(level);
    return map;
  }

  PermissionsCompanion toCompanion(bool nullToAbsent) {
    return PermissionsCompanion(
      permissionId: Value(permissionId),
      updatedAt: Value(updatedAt),
      roles: Value(roles),
      level: Value(level),
    );
  }

  factory Permission.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Permission(
      permissionId: serializer.fromJson<int>(json['permissionId']),
      updatedAt: serializer.fromJson<String>(json['updatedAt']),
      roles: serializer.fromJson<String>(json['roles']),
      level: serializer.fromJson<String>(json['level']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'permissionId': serializer.toJson<int>(permissionId),
      'updatedAt': serializer.toJson<String>(updatedAt),
      'roles': serializer.toJson<String>(roles),
      'level': serializer.toJson<String>(level),
    };
  }

  Permission copyWith(
          {int? permissionId,
          String? updatedAt,
          String? roles,
          String? level}) =>
      Permission(
        permissionId: permissionId ?? this.permissionId,
        updatedAt: updatedAt ?? this.updatedAt,
        roles: roles ?? this.roles,
        level: level ?? this.level,
      );
  @override
  String toString() {
    return (StringBuffer('Permission(')
          ..write('permissionId: $permissionId, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('roles: $roles, ')
          ..write('level: $level')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(permissionId, updatedAt, roles, level);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Permission &&
          other.permissionId == this.permissionId &&
          other.updatedAt == this.updatedAt &&
          other.roles == this.roles &&
          other.level == this.level);
}

class PermissionsCompanion extends UpdateCompanion<Permission> {
  final Value<int> permissionId;
  final Value<String> updatedAt;
  final Value<String> roles;
  final Value<String> level;
  const PermissionsCompanion({
    this.permissionId = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.roles = const Value.absent(),
    this.level = const Value.absent(),
  });
  PermissionsCompanion.insert({
    this.permissionId = const Value.absent(),
    required String updatedAt,
    required String roles,
    required String level,
  })  : updatedAt = Value(updatedAt),
        roles = Value(roles),
        level = Value(level);
  static Insertable<Permission> custom({
    Expression<int>? permissionId,
    Expression<String>? updatedAt,
    Expression<String>? roles,
    Expression<String>? level,
  }) {
    return RawValuesInsertable({
      if (permissionId != null) 'permission_id': permissionId,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (roles != null) 'roles': roles,
      if (level != null) 'level': level,
    });
  }

  PermissionsCompanion copyWith(
      {Value<int>? permissionId,
      Value<String>? updatedAt,
      Value<String>? roles,
      Value<String>? level}) {
    return PermissionsCompanion(
      permissionId: permissionId ?? this.permissionId,
      updatedAt: updatedAt ?? this.updatedAt,
      roles: roles ?? this.roles,
      level: level ?? this.level,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (permissionId.present) {
      map['permission_id'] = Variable<int>(permissionId.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    if (roles.present) {
      map['roles'] = Variable<String>(roles.value);
    }
    if (level.present) {
      map['level'] = Variable<String>(level.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PermissionsCompanion(')
          ..write('permissionId: $permissionId, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('roles: $roles, ')
          ..write('level: $level')
          ..write(')'))
        .toString();
  }
}

class $RoomParticipantsTable extends RoomParticipants
    with TableInfo<$RoomParticipantsTable, RoomParticipant> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RoomParticipantsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _roomIdMeta = const VerificationMeta('roomId');
  @override
  late final GeneratedColumn<int> roomId = GeneratedColumn<int>(
      'room_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES rooms(room_id)');
  static const VerificationMeta _accountIdMeta =
      const VerificationMeta('accountId');
  @override
  late final GeneratedColumn<int> accountId = GeneratedColumn<int>(
      'account_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES accounts(account_id)');
  @override
  List<GeneratedColumn> get $columns => [roomId, accountId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'room_participants';
  @override
  VerificationContext validateIntegrity(Insertable<RoomParticipant> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('room_id')) {
      context.handle(_roomIdMeta,
          roomId.isAcceptableOrUnknown(data['room_id']!, _roomIdMeta));
    } else if (isInserting) {
      context.missing(_roomIdMeta);
    }
    if (data.containsKey('account_id')) {
      context.handle(_accountIdMeta,
          accountId.isAcceptableOrUnknown(data['account_id']!, _accountIdMeta));
    } else if (isInserting) {
      context.missing(_accountIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  RoomParticipant map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RoomParticipant(
      roomId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}room_id'])!,
      accountId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}account_id'])!,
    );
  }

  @override
  $RoomParticipantsTable createAlias(String alias) {
    return $RoomParticipantsTable(attachedDatabase, alias);
  }
}

class RoomParticipant extends DataClass implements Insertable<RoomParticipant> {
  final int roomId;
  final int accountId;
  const RoomParticipant({required this.roomId, required this.accountId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['room_id'] = Variable<int>(roomId);
    map['account_id'] = Variable<int>(accountId);
    return map;
  }

  RoomParticipantsCompanion toCompanion(bool nullToAbsent) {
    return RoomParticipantsCompanion(
      roomId: Value(roomId),
      accountId: Value(accountId),
    );
  }

  factory RoomParticipant.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RoomParticipant(
      roomId: serializer.fromJson<int>(json['roomId']),
      accountId: serializer.fromJson<int>(json['accountId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'roomId': serializer.toJson<int>(roomId),
      'accountId': serializer.toJson<int>(accountId),
    };
  }

  RoomParticipant copyWith({int? roomId, int? accountId}) => RoomParticipant(
        roomId: roomId ?? this.roomId,
        accountId: accountId ?? this.accountId,
      );
  @override
  String toString() {
    return (StringBuffer('RoomParticipant(')
          ..write('roomId: $roomId, ')
          ..write('accountId: $accountId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(roomId, accountId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RoomParticipant &&
          other.roomId == this.roomId &&
          other.accountId == this.accountId);
}

class RoomParticipantsCompanion extends UpdateCompanion<RoomParticipant> {
  final Value<int> roomId;
  final Value<int> accountId;
  final Value<int> rowid;
  const RoomParticipantsCompanion({
    this.roomId = const Value.absent(),
    this.accountId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RoomParticipantsCompanion.insert({
    required int roomId,
    required int accountId,
    this.rowid = const Value.absent(),
  })  : roomId = Value(roomId),
        accountId = Value(accountId);
  static Insertable<RoomParticipant> custom({
    Expression<int>? roomId,
    Expression<int>? accountId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (roomId != null) 'room_id': roomId,
      if (accountId != null) 'account_id': accountId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RoomParticipantsCompanion copyWith(
      {Value<int>? roomId, Value<int>? accountId, Value<int>? rowid}) {
    return RoomParticipantsCompanion(
      roomId: roomId ?? this.roomId,
      accountId: accountId ?? this.accountId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (roomId.present) {
      map['room_id'] = Variable<int>(roomId.value);
    }
    if (accountId.present) {
      map['account_id'] = Variable<int>(accountId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoomParticipantsCompanion(')
          ..write('roomId: $roomId, ')
          ..write('accountId: $accountId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RoomsTable extends Rooms with TableInfo<$RoomsTable, Room> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RoomsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _roomIdMeta = const VerificationMeta('roomId');
  @override
  late final GeneratedColumn<int> roomId = GeneratedColumn<int>(
      'room_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _topicMeta = const VerificationMeta('topic');
  @override
  late final GeneratedColumn<String> topic = GeneratedColumn<String>(
      'topic', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _lastMessageMeta =
      const VerificationMeta('lastMessage');
  @override
  late final GeneratedColumn<String> lastMessage = GeneratedColumn<String>(
      'last_message', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [roomId, updatedAt, topic, name, lastMessage];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'rooms';
  @override
  VerificationContext validateIntegrity(Insertable<Room> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('room_id')) {
      context.handle(_roomIdMeta,
          roomId.isAcceptableOrUnknown(data['room_id']!, _roomIdMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('topic')) {
      context.handle(
          _topicMeta, topic.isAcceptableOrUnknown(data['topic']!, _topicMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('last_message')) {
      context.handle(
          _lastMessageMeta,
          lastMessage.isAcceptableOrUnknown(
              data['last_message']!, _lastMessageMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {roomId};
  @override
  Room map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Room(
      roomId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}room_id'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}updated_at'])!,
      topic: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}topic']),
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      lastMessage: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}last_message']),
    );
  }

  @override
  $RoomsTable createAlias(String alias) {
    return $RoomsTable(attachedDatabase, alias);
  }
}

class Room extends DataClass implements Insertable<Room> {
  final int roomId;
  final String updatedAt;
  final String? topic;
  final String name;
  final String? lastMessage;
  const Room(
      {required this.roomId,
      required this.updatedAt,
      this.topic,
      required this.name,
      this.lastMessage});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['room_id'] = Variable<int>(roomId);
    map['updated_at'] = Variable<String>(updatedAt);
    if (!nullToAbsent || topic != null) {
      map['topic'] = Variable<String>(topic);
    }
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || lastMessage != null) {
      map['last_message'] = Variable<String>(lastMessage);
    }
    return map;
  }

  RoomsCompanion toCompanion(bool nullToAbsent) {
    return RoomsCompanion(
      roomId: Value(roomId),
      updatedAt: Value(updatedAt),
      topic:
          topic == null && nullToAbsent ? const Value.absent() : Value(topic),
      name: Value(name),
      lastMessage: lastMessage == null && nullToAbsent
          ? const Value.absent()
          : Value(lastMessage),
    );
  }

  factory Room.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Room(
      roomId: serializer.fromJson<int>(json['roomId']),
      updatedAt: serializer.fromJson<String>(json['updatedAt']),
      topic: serializer.fromJson<String?>(json['topic']),
      name: serializer.fromJson<String>(json['name']),
      lastMessage: serializer.fromJson<String?>(json['lastMessage']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'roomId': serializer.toJson<int>(roomId),
      'updatedAt': serializer.toJson<String>(updatedAt),
      'topic': serializer.toJson<String?>(topic),
      'name': serializer.toJson<String>(name),
      'lastMessage': serializer.toJson<String?>(lastMessage),
    };
  }

  Room copyWith(
          {int? roomId,
          String? updatedAt,
          Value<String?> topic = const Value.absent(),
          String? name,
          Value<String?> lastMessage = const Value.absent()}) =>
      Room(
        roomId: roomId ?? this.roomId,
        updatedAt: updatedAt ?? this.updatedAt,
        topic: topic.present ? topic.value : this.topic,
        name: name ?? this.name,
        lastMessage: lastMessage.present ? lastMessage.value : this.lastMessage,
      );
  @override
  String toString() {
    return (StringBuffer('Room(')
          ..write('roomId: $roomId, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('topic: $topic, ')
          ..write('name: $name, ')
          ..write('lastMessage: $lastMessage')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(roomId, updatedAt, topic, name, lastMessage);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Room &&
          other.roomId == this.roomId &&
          other.updatedAt == this.updatedAt &&
          other.topic == this.topic &&
          other.name == this.name &&
          other.lastMessage == this.lastMessage);
}

class RoomsCompanion extends UpdateCompanion<Room> {
  final Value<int> roomId;
  final Value<String> updatedAt;
  final Value<String?> topic;
  final Value<String> name;
  final Value<String?> lastMessage;
  const RoomsCompanion({
    this.roomId = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.topic = const Value.absent(),
    this.name = const Value.absent(),
    this.lastMessage = const Value.absent(),
  });
  RoomsCompanion.insert({
    this.roomId = const Value.absent(),
    required String updatedAt,
    this.topic = const Value.absent(),
    required String name,
    this.lastMessage = const Value.absent(),
  })  : updatedAt = Value(updatedAt),
        name = Value(name);
  static Insertable<Room> custom({
    Expression<int>? roomId,
    Expression<String>? updatedAt,
    Expression<String>? topic,
    Expression<String>? name,
    Expression<String>? lastMessage,
  }) {
    return RawValuesInsertable({
      if (roomId != null) 'room_id': roomId,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (topic != null) 'topic': topic,
      if (name != null) 'name': name,
      if (lastMessage != null) 'last_message': lastMessage,
    });
  }

  RoomsCompanion copyWith(
      {Value<int>? roomId,
      Value<String>? updatedAt,
      Value<String?>? topic,
      Value<String>? name,
      Value<String?>? lastMessage}) {
    return RoomsCompanion(
      roomId: roomId ?? this.roomId,
      updatedAt: updatedAt ?? this.updatedAt,
      topic: topic ?? this.topic,
      name: name ?? this.name,
      lastMessage: lastMessage ?? this.lastMessage,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (roomId.present) {
      map['room_id'] = Variable<int>(roomId.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    if (topic.present) {
      map['topic'] = Variable<String>(topic.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (lastMessage.present) {
      map['last_message'] = Variable<String>(lastMessage.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoomsCompanion(')
          ..write('roomId: $roomId, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('topic: $topic, ')
          ..write('name: $name, ')
          ..write('lastMessage: $lastMessage')
          ..write(')'))
        .toString();
  }
}

class $UserCharactersTable extends UserCharacters
    with TableInfo<$UserCharactersTable, UserCharacter> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserCharactersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _accountIdMeta =
      const VerificationMeta('accountId');
  @override
  late final GeneratedColumn<int> accountId = GeneratedColumn<int>(
      'account_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES accounts(account_id)');
  static const VerificationMeta _characterAccountIdMeta =
      const VerificationMeta('characterAccountId');
  @override
  late final GeneratedColumn<int> characterAccountId = GeneratedColumn<int>(
      'character_account_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES accounts(account_id)');
  static const VerificationMeta _indexMeta = const VerificationMeta('index');
  @override
  late final GeneratedColumn<int> index = GeneratedColumn<int>(
      'index', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [accountId, characterAccountId, index];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_characters';
  @override
  VerificationContext validateIntegrity(Insertable<UserCharacter> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('account_id')) {
      context.handle(_accountIdMeta,
          accountId.isAcceptableOrUnknown(data['account_id']!, _accountIdMeta));
    } else if (isInserting) {
      context.missing(_accountIdMeta);
    }
    if (data.containsKey('character_account_id')) {
      context.handle(
          _characterAccountIdMeta,
          characterAccountId.isAcceptableOrUnknown(
              data['character_account_id']!, _characterAccountIdMeta));
    } else if (isInserting) {
      context.missing(_characterAccountIdMeta);
    }
    if (data.containsKey('index')) {
      context.handle(
          _indexMeta, index.isAcceptableOrUnknown(data['index']!, _indexMeta));
    } else if (isInserting) {
      context.missing(_indexMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  UserCharacter map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserCharacter(
      accountId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}account_id'])!,
      characterAccountId: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}character_account_id'])!,
      index: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}index'])!,
    );
  }

  @override
  $UserCharactersTable createAlias(String alias) {
    return $UserCharactersTable(attachedDatabase, alias);
  }
}

class UserCharacter extends DataClass implements Insertable<UserCharacter> {
  final int accountId;
  final int characterAccountId;
  final int index;
  const UserCharacter(
      {required this.accountId,
      required this.characterAccountId,
      required this.index});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['account_id'] = Variable<int>(accountId);
    map['character_account_id'] = Variable<int>(characterAccountId);
    map['index'] = Variable<int>(index);
    return map;
  }

  UserCharactersCompanion toCompanion(bool nullToAbsent) {
    return UserCharactersCompanion(
      accountId: Value(accountId),
      characterAccountId: Value(characterAccountId),
      index: Value(index),
    );
  }

  factory UserCharacter.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserCharacter(
      accountId: serializer.fromJson<int>(json['accountId']),
      characterAccountId: serializer.fromJson<int>(json['characterAccountId']),
      index: serializer.fromJson<int>(json['index']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'accountId': serializer.toJson<int>(accountId),
      'characterAccountId': serializer.toJson<int>(characterAccountId),
      'index': serializer.toJson<int>(index),
    };
  }

  UserCharacter copyWith(
          {int? accountId, int? characterAccountId, int? index}) =>
      UserCharacter(
        accountId: accountId ?? this.accountId,
        characterAccountId: characterAccountId ?? this.characterAccountId,
        index: index ?? this.index,
      );
  @override
  String toString() {
    return (StringBuffer('UserCharacter(')
          ..write('accountId: $accountId, ')
          ..write('characterAccountId: $characterAccountId, ')
          ..write('index: $index')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(accountId, characterAccountId, index);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserCharacter &&
          other.accountId == this.accountId &&
          other.characterAccountId == this.characterAccountId &&
          other.index == this.index);
}

class UserCharactersCompanion extends UpdateCompanion<UserCharacter> {
  final Value<int> accountId;
  final Value<int> characterAccountId;
  final Value<int> index;
  final Value<int> rowid;
  const UserCharactersCompanion({
    this.accountId = const Value.absent(),
    this.characterAccountId = const Value.absent(),
    this.index = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserCharactersCompanion.insert({
    required int accountId,
    required int characterAccountId,
    required int index,
    this.rowid = const Value.absent(),
  })  : accountId = Value(accountId),
        characterAccountId = Value(characterAccountId),
        index = Value(index);
  static Insertable<UserCharacter> custom({
    Expression<int>? accountId,
    Expression<int>? characterAccountId,
    Expression<int>? index,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (accountId != null) 'account_id': accountId,
      if (characterAccountId != null)
        'character_account_id': characterAccountId,
      if (index != null) 'index': index,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserCharactersCompanion copyWith(
      {Value<int>? accountId,
      Value<int>? characterAccountId,
      Value<int>? index,
      Value<int>? rowid}) {
    return UserCharactersCompanion(
      accountId: accountId ?? this.accountId,
      characterAccountId: characterAccountId ?? this.characterAccountId,
      index: index ?? this.index,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (accountId.present) {
      map['account_id'] = Variable<int>(accountId.value);
    }
    if (characterAccountId.present) {
      map['character_account_id'] = Variable<int>(characterAccountId.value);
    }
    if (index.present) {
      map['index'] = Variable<int>(index.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserCharactersCompanion(')
          ..write('accountId: $accountId, ')
          ..write('characterAccountId: $characterAccountId, ')
          ..write('index: $index, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UserPermissionsTable extends UserPermissions
    with TableInfo<$UserPermissionsTable, UserPermission> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserPermissionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _accountIdMeta =
      const VerificationMeta('accountId');
  @override
  late final GeneratedColumn<int> accountId = GeneratedColumn<int>(
      'account_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES accounts(account_id)');
  static const VerificationMeta _permissionIdMeta =
      const VerificationMeta('permissionId');
  @override
  late final GeneratedColumn<int> permissionId = GeneratedColumn<int>(
      'permission_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES permissions(permission_id)');
  @override
  List<GeneratedColumn> get $columns => [accountId, permissionId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_permissions';
  @override
  VerificationContext validateIntegrity(Insertable<UserPermission> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('account_id')) {
      context.handle(_accountIdMeta,
          accountId.isAcceptableOrUnknown(data['account_id']!, _accountIdMeta));
    } else if (isInserting) {
      context.missing(_accountIdMeta);
    }
    if (data.containsKey('permission_id')) {
      context.handle(
          _permissionIdMeta,
          permissionId.isAcceptableOrUnknown(
              data['permission_id']!, _permissionIdMeta));
    } else if (isInserting) {
      context.missing(_permissionIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  UserPermission map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserPermission(
      accountId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}account_id'])!,
      permissionId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}permission_id'])!,
    );
  }

  @override
  $UserPermissionsTable createAlias(String alias) {
    return $UserPermissionsTable(attachedDatabase, alias);
  }
}

class UserPermission extends DataClass implements Insertable<UserPermission> {
  final int accountId;
  final int permissionId;
  const UserPermission({required this.accountId, required this.permissionId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['account_id'] = Variable<int>(accountId);
    map['permission_id'] = Variable<int>(permissionId);
    return map;
  }

  UserPermissionsCompanion toCompanion(bool nullToAbsent) {
    return UserPermissionsCompanion(
      accountId: Value(accountId),
      permissionId: Value(permissionId),
    );
  }

  factory UserPermission.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserPermission(
      accountId: serializer.fromJson<int>(json['accountId']),
      permissionId: serializer.fromJson<int>(json['permissionId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'accountId': serializer.toJson<int>(accountId),
      'permissionId': serializer.toJson<int>(permissionId),
    };
  }

  UserPermission copyWith({int? accountId, int? permissionId}) =>
      UserPermission(
        accountId: accountId ?? this.accountId,
        permissionId: permissionId ?? this.permissionId,
      );
  @override
  String toString() {
    return (StringBuffer('UserPermission(')
          ..write('accountId: $accountId, ')
          ..write('permissionId: $permissionId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(accountId, permissionId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserPermission &&
          other.accountId == this.accountId &&
          other.permissionId == this.permissionId);
}

class UserPermissionsCompanion extends UpdateCompanion<UserPermission> {
  final Value<int> accountId;
  final Value<int> permissionId;
  final Value<int> rowid;
  const UserPermissionsCompanion({
    this.accountId = const Value.absent(),
    this.permissionId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserPermissionsCompanion.insert({
    required int accountId,
    required int permissionId,
    this.rowid = const Value.absent(),
  })  : accountId = Value(accountId),
        permissionId = Value(permissionId);
  static Insertable<UserPermission> custom({
    Expression<int>? accountId,
    Expression<int>? permissionId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (accountId != null) 'account_id': accountId,
      if (permissionId != null) 'permission_id': permissionId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserPermissionsCompanion copyWith(
      {Value<int>? accountId, Value<int>? permissionId, Value<int>? rowid}) {
    return UserPermissionsCompanion(
      accountId: accountId ?? this.accountId,
      permissionId: permissionId ?? this.permissionId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (accountId.present) {
      map['account_id'] = Variable<int>(accountId.value);
    }
    if (permissionId.present) {
      map['permission_id'] = Variable<int>(permissionId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserPermissionsCompanion(')
          ..write('accountId: $accountId, ')
          ..write('permissionId: $permissionId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $AccountsTable accounts = $AccountsTable(this);
  late final $MessagesTable messages = $MessagesTable(this);
  late final $PermissionsTable permissions = $PermissionsTable(this);
  late final $RoomParticipantsTable roomParticipants =
      $RoomParticipantsTable(this);
  late final $RoomsTable rooms = $RoomsTable(this);
  late final $UserCharactersTable userCharacters = $UserCharactersTable(this);
  late final $UserPermissionsTable userPermissions =
      $UserPermissionsTable(this);
  late final AccountDao accountDao = AccountDao(this as AppDatabase);
  late final MessageDao messageDao = MessageDao(this as AppDatabase);
  late final PermissionDao permissionDao = PermissionDao(this as AppDatabase);
  late final RoomParticipantDao roomParticipantDao =
      RoomParticipantDao(this as AppDatabase);
  late final RoomDao roomDao = RoomDao(this as AppDatabase);
  late final UserCharacterDao userCharacterDao =
      UserCharacterDao(this as AppDatabase);
  late final UserPermissionDao userPermissionDao =
      UserPermissionDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        accounts,
        messages,
        permissions,
        roomParticipants,
        rooms,
        userCharacters,
        userPermissions
      ];
}
