# 1列目の文字列の種類（異なる文字列の集合）を求めよ．
# 確認にはsort, uniqコマンドを用いよ．

cut -f 1 ../../data/hightemp.txt | sort | uniq | wc
