# -*- coding: utf-8 -*-
# @author = himkt
# @create = 2015/07/20

'''
20. JSONデータの読み込み

Wikipedia記事のJSONファイルを読み込み，
「イギリス」に関する記事本文を表示せよ．
問題21-29では，ここで抽出した記事本文に対して実行せよ．
'''

import json

w = open('../data/jawiki-country-uk.txt', 'w')

for line in open('../data/jawiki-country.json', 'r'):
    record = json.loads(line)
    if record['title'] == u"イギリス":

        # avoid codec error
        text = record['text'].encode('utf-8')
        w.write(text)
