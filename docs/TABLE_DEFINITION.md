summonbell
アプリの具体的な要件や目的としては、
このアプリは、ディスクトップアプリです。
ユーザーが登録したキャラクターとログインしたユーザーで会話ができるアプリです。
DBにはsqliteを利用します。
キャラクターはキャラクターAPIによるキャラクターに応じた返答を行うことができます。

アプリログイン時点でユーザーはメールアドレスによるログインを行います。
アカウントがなければ、メールアドレスの追加でいくらでもユーザを登録できます。
ユーザはログイン後、アプリ内で好きなキャラクターを追加することができます。
キャラクター追加後、アプリ内から登録済みの好きなキャラクターを選択しチャットを開始することができます。

チャットルームにはユーザー１人に対し、複数のキャラクターを追加することができ、チャットルーム内で複数のキャラクターとチャットを行うことも可能です。

```mermaid
erDiagram
    ACCOUNT ||--o{ USER_CHARACTERS : owns
    USER_CHARACTERS }|--|| ACCOUNT : is
    ACCOUNT ||--o{ ROOM_PARTICIPANTS : participates_in
    ROOM_PARTICIPANTS }|--|| ROOM : belongs_to
    ACCOUNT ||--o{ MESSAGE : sends
    ROOM ||--o{ MESSAGE : contains
    ACCOUNT ||--o{ USER_PERMISSIONS : has
    PERMISSIONS ||--o{ USER_PERMISSIONS : grants
    USER_PERMISSIONS }|--|| ACCOUNT : belongs_to

    ACCOUNT {
        int account_id PK
        datetime createdAt
        string password
        string email
        string loginTokens
        string status
        datetime updatedAt
        string username
        int account_type
    }
    USER_CHARACTERS {
        int account_id FK
        int character_account_id FK
        int index
    }
    ROOM {
        int room_id PK
        datetime updatedAt
        string topic
        string name
        string lastMessage
    }
    ROOM_PARTICIPANTS {
        int room_id FK
        int account_id FK
    }
    MESSAGE {
        int message_id PK
        int room_id FK
        string msg
        int account_id FK
        datetime updatedAt
    }
    PERMISSIONS {
        int permission_id PK
        datetime updatedAt
        int roles
        int level
    }
    USER_PERMISSIONS {
        int account_id FK
        int permission_id FK
    }
```
    
```sql
CREATE TABLE ACCOUNT (
    account_id INTEGER PRIMARY KEY AUTOINCREMENT,
    createdAt TEXT,
    password TEXT,
    email TEXT, -- ユーザーに直接紐づくbotは同じメアドとする
    loginTokens TEXT,
    status TEXT,
    updatedAt TEXT,
    username TEXT,
    account_type TEXT
);

CREATE TABLE USER_CHARACTERS (
    account_id INTEGER,
    character_account_id INTEGER,
    index INTEGER, -- ポケモンシステム採用１０体までにしておき場所で割り振る
    FOREIGN KEY (account_id) REFERENCES ACCOUNT(account_id),
    FOREIGN KEY (character_account_id) REFERENCES ACCOUNT(account_id)
);

CREATE TABLE ROOM (
    room_id INTEGER PRIMARY KEY AUTOINCREMENT,
    updatedAt TEXT,
    topic TEXT,
    name TEXT,
    lastMessage TEXT
);

CREATE TABLE ROOM_PARTICIPANTS (
    room_id INTEGER,
    account_id INTEGER,
    FOREIGN KEY (room_id) REFERENCES ROOM(room_id),
    FOREIGN KEY (account_id) REFERENCES ACCOUNT(account_id)
);

CREATE TABLE MESSAGE (
    message_id INTEGER PRIMARY KEY AUTOINCREMENT,
    room_id INTEGER,
    msg TEXT,
    account_id INTEGER,
    updatedAt TEXT,
    FOREIGN KEY (room_id) REFERENCES ROOM(room_id),
    FOREIGN KEY (account_id) REFERENCES ACCOUNT(account_id)
);

CREATE TABLE PERMISSIONS (
    permission_id INTEGER PRIMARY KEY AUTOINCREMENT,
    updatedAt TEXT,
    roles TEXT,
    level TEXT
);

CREATE TABLE USER_PERMISSIONS (
    account_id INTEGER,
    permission_id INTEGER,
    FOREIGN KEY (account_id) REFERENCES ACCOUNT(account_id),
    FOREIGN KEY (permission_id) REFERENCES PERMISSIONS(permission_id)
);
```