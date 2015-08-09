# -*- coding: utf-8 -*-
# @author = himkt
# @create = 2015/07/28

'''
42. 係り元と係り先の文節の表示

係り元の文節と係り先の文節のテキストを
タブ区切り形式ですべて抽出せよ．
ただし，句読点などの記号は出力しないようにせよ．
'''

import knock41

def knock42(chunks):
    result = []
    for chunk in chunks:
        if chunk.dst != '-1':
            phrase = ''
            phrase += ''.join([morph.surface for morph in chunk.morphs if morph.pos != '記号'])
            phrase += '\t'
            phrase += ''.join([morph.surface for morph in chunks[int(chunk.dst)].morphs if morph.pos != '記号'])
            result.append(phrase)
    return result

chunks_list = knock41.knock41()
for chunks in chunks_list:
    for phrase in knock42(chunks):
        print phrase
