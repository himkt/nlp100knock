# -*- coding: utf-8 -*-
# @author = himkt
# @create = 2015/08/02

'''
54. 品詞タグ付け

Stanford Core NLPの解析結果XMLを読み込み，
単語，レンマ，品詞をタブ区切り形式で出力せよ．
'''

import xml.etree.ElementTree as ET

tree      = ET.parse('../data/nlp.xml')
root      = tree.getroot()
tokens    = root.findall("./document/sentences/sentence/tokens/token")

for token in tokens:
    element = [item.text for item in token if item.tag in ['word', 'lemma', 'POS']]
    print "\t".join(element)
