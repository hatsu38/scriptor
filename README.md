# Scriptor

Scriptorはscriptフォルダにあるrubyファイルを、ブラウザから実行できるようにしたRails Engineです。
`Rails 8.0.0 >= 0` の場合 `bin/rails generate scriot my_script` を実行すると `script/myscript.rb` が作成されます。
(Rails 8.0.0 以上でなくても、scriptフォルダにファイルを置いておけば利用可能です。)

このscriptをブラウザから一覧で見たり、詳細ページではコードを閲覧したり、実行できます。

https://github.com/user-attachments/assets/057c75ce-7c8e-4c89-a238-13546b5797f1



## 使い方

1. `bundle add scriptor`
2. `bin/rails generate maintenance_tasks:install` を実行
    - `config/routes.rb` に `mount Scriptor::Engine => "/scriptor"` が記載されます
    - `db/migrations/****_create_scriptor_executions.scriptor.rb` ファイルが作成されます
3. scriptフォルダにスクリプトを作ると、/scriptor ページにスクリプト一覧が並びます

で完成です。

## リリース手順

0. version.rb と Gemfile.lockのscriptorのバージョンが適切か確認しましょう


1. gemのbuild
    ```shell
    gem build scriptor.gemspec
    ```

2. gemのpush
    ```shll
    gem push scriptor-*.*.*.gem
    ```

## Contributing
- 色々足りていません。大歓迎です。

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
