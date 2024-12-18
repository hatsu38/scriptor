# Scriptor

Scriptorはscriptフォルダにあるrubyファイルを、ブラウザから実行できるようにしたRails Engineです。
`Rails 8.0.0 >= 0` の場合 `bin/rails generate scriot my_script` を実行すると `script/myscript.rb` が作成されます。
(Rails 8.0.0 以上でなくても、scriptフォルダにファイルを置いておけば利用可能です。)

このscriptをブラウザから一覧で見たり、詳細ページではコードを閲覧したり、実行できます。

<image src="https://github.com/user-attachments/assets/b63b75b1-517e-464f-a437-68067fcd4179" width="500" />
<image src="https://github.com/user-attachments/assets/ec2ed5e1-4171-4bec-a800-aa52a7eefb0d" width="500" />


## 使い方

1. `bundle add scriptor`
2. config/routes.rb に `mount Scriptor::Engine => "/scriptor"` を記載
3. scriptフォルダにスクリプトを作る

で完成です。


## Contributing
- 色々足りていません。大歓迎です。

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
