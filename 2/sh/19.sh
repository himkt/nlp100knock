# 各行の1列目の文字列の出現頻度を求め，
# その高い順に並べて表示せよ．
# 確認にはcut, uniq, sortコマンドを用いよ．

cut -f 1 ../../data/hightemp.txt | sort | uniq -c | sort -r
