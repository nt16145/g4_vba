# 使い方
1. SQLDUMPファイルの編集
2. docker build ./
3. docker run -d -it <ID>
4. docker inspectでIPの確認
5. [psqlPDBC](https://www.sraoss.co.jp/tech-blog/pgsql/psqlodbc/)のインストール
6. 好きなだけ実験を楽しむ

# 今の問題点
- psqlコマンドがすべて文字化けする(docker execで一応化けない)
- MacだとExcelがわのActiveXのドライバの関係でできない(これは私には対処できない)
- リレーションがなんか知らんが入らない