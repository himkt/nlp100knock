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


chunks_list = knock41.knock41()

for chunks in chunks_list:
    for chunk in chunks:
        if chunk.dst != '-1':
            print ''.join([morph.surface for morph in chunk.morphs]),
            print '\t',
            print ''.join([morph.surface for morph in chunks[int(chunk.dst)].morphs])
