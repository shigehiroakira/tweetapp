## user テーブル
| Column          | Type    |  Option      |
|-----------------|---------|--------------|
| nickname        | stiring | null: false  |
| last_name       | string  | null: false  |
| first_name      | string  | null: false  |
| last_name_kana  | string  |null: false   |
| first_name_kana | string  | null: false  |
| birthday        | date    | null: false  |
| email           | string  | null: false  |
| password        | string  | null: false  |

### Association

- has_many :tweets
- has_many :comment
- has_many :sns_credential

## sns_credentialモデル

| Column         | Type      |  Option           |
|----------------|-----------|-------------------|
| provider       | string    |                   |
| uid            | string    |                   | 
| user           | references| foreign_key: true |

## Association
- belongs_to :user


## tweet テーブル

| Column     | Type       | Option                          |
|------------|------------|---------------------------------|
| text       | string     |  null: false                    |
| image      | string     |  null: false                    |
| user       | references |  null: false, foreign_key: true |

### Association
- has_many   :comments
- belongs_to :user


## comment テーブル

| Column      |  Type      | Option                         |
|-------------|------------|--------------------------------|
| text        | string     | null: false                    |
| user        | references | null: false, foreign_key: true |
| tweet       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :tweet

