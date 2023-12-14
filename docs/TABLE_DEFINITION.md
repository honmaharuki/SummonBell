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
    MEMBER ||--|{ USER : is
    MEMBER ||--|{ CHARACTER : is
    MEMBER ||--o{ CHATROOM_PARTICIPANT : participates_in
    CHATROOM_PARTICIPANT ||--o{ CHATROOM : belongs_to
    CHATROOM ||--o{ CHAT : contains
    MEMBER ||--o{ CHAT : sends
    USER ||--o{ USER_CHARACTER : selects
    CHARACTER ||--|| USER_CHARACTER : selected_by

    MEMBER {
        int member_id PK
    }

    USER {
        int user_id PK
        int member_id FK
        string email
        string username
    }

    CHARACTER {
        int character_id PK
        int member_id FK
        string character_name
    }

    USER_CHARACTER {
        int user_character_id PK
        int user_id FK
        int character_id FK
    }

    CHATROOM {
        int chatroom_id PK
        string title
    }

    CHATROOM_PARTICIPANT {
        int participant_id PK
        int chatroom_id FK
        int member_id FK
    }

    CHAT {
        int chat_id PK
        int chatroom_id FK
        int member_sender_id FK
        string content
    }
```