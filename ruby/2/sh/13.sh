# 12で作ったcol1.txtとcol2.txtを結合し，
# 元のファイルの1列目と2列目をタブ区切りで並べたテキストファイルを作成せよ．
# 確認にはpasteコマンドを用いよ．

./12.sh; paste -d ' ' col1.txt col2.txt
