# タブ1文字につきスペース1文字に置換せよ．
# 確認にはsedコマンド，trコマンド，
# もしくはexpandコマンドを用いよ．

# sed
cat ../../data/hightemp.txt| sed s/$'\t'/' '/g
# tr
## cat ../../data/hightemp.txt| tr '\t' ' '
