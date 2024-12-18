# Scriptor

Scriptorはscriptフォルダにあるrubyファイルを、ブラウザから実行できるようにしたRails Engineです。
`Rails 8.0.0 >= 0` の場合 `bin/rails generate scriot my_script` を実行すると `script/myscript.rb` が作成されます。
(Rails 8.0.0 以上でなくても、scriptフォルダにファイルを置いておけば利用可能です。)

このscriptをブラウザから一覧で見たり、詳細ページではコードを閲覧したり、実行できます。

## 使い方

1. `bundle add scriptor`
2. config/routes.rb に `mount Scriptor::Engine => "/scriptor"` を記載
3. scriptフォルダにスクリプトを作る

で完成です。


## Contributing
- 色々足りていません。大歓迎です。

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
