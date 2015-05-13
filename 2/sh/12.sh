# 各行の1列目だけを抜き出したものをcol1.txtに，
# 2列目だけを抜き出したものをcol2.txtとしてファイルに保存せよ．
# 確認にはcutコマンドを用いよ．

cut -f 1 ../../data/hightemp.txt > ../../data/col1.txt; cut -f 2 ../../data/hightemp.txt > ../../data/col2.txt
