
curl http://www.cl.ecei.tohoku.ac.jp/nlp100/data/hightemp.txt > data/hightemp.txt

wget http://www.cl.ecei.tohoku.ac.jp/nlp100/data/jawiki-country.json.gz -P data
gunzip data/jawiki-country.json.gz

curl http://www.cl.ecei.tohoku.ac.jp/nlp100/data/neko.txt > data/neko.txt
mecab < data/neko.txt > data/neko.txt.mecab
cabocha -f1 < data/neko.txt > data/neko.txt.cabocha

curl http://www.cl.ecei.tohoku.ac.jp/nlp100/data/nlp.txt > data/nlp.txt

wget http://www.cl.ecei.tohoku.ac.jp/nlp100/data/artist.json.gz -P data
gunzip data/artist.json.gz

wget http://www.cs.cornell.edu/people/pabo/movie-review-data/rt-polaritydata.tar.gz -P data
tar zxvf data/rt-polaritydata.tar.gz -C data
nkf -w data/rt-polaritydata/rt-polarity.pos > data/rt-polaritydata/rt-polarity.pos.utf8
nkf -w data/rt-polaritydata/rt-polarity.neg > data/rt-polaritydata/rt-polarity.neg.utf8

mv data/rt-polaritydata/rt-polarity.pos.utf8 data/rt-polaritydata/rt-polarity.pos
mv data/rt-polaritydata/rt-polarity.neg.utf8 data/rt-polaritydata/rt-polarity.neg

wget http://www.cl.ecei.tohoku.ac.jp/nlp100/data/enwiki-20150112-400-r10-105752.txt.bz2 -P data
bunzip2 data/enwiki-20150112-400-r10-105752.txt.bz2

wget http://www.cl.ecei.tohoku.ac.jp/nlp100/data/enwiki-20150112-400-r100-10576.txt.bz2 -P data
bunzip2 data/enwiki-20150112-400-r100-10576.txt.bz2

wget https://storage.googleapis.com/google-code-archive-source/v2/code.google.com/word2vec/source-archive.zip -P data
unzip data/source-archive.zip -d data
mv data/word2vec/trunk/questions-words.txt data/questions-words.txt
rm -rf data/word2vec data/source-archive.zip*

wget http://www.cs.technion.ac.il/~gabr/resources/data/wordsim353/wordsim353.zip -P data
unzip data/wordsim353.zip -d data
rm data/set*.csv
rm data/set*.tab
rm data/combined.csv
mv data/combined.tab data/combined.tsv
