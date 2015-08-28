# 各行を3コラム目の数値の逆順で整列せよ
# （注意: 各行の内容は変更せずに並び替えよ）．
# 確認にはsortコマンドを用いよ
# （この問題はコマンドで実行した時の結果と合わなくてもよい）．


# this answer uses cat
# # cat ../../data/hightemp.txt | cut -f 3 | sort -r
# without cat
# cut -f 3 ../../data/hightemp.txt | sort -r

sort -r ../../data/hightemp.txt
