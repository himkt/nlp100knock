# -*- coding: utf-8 -*-
# @author = himkt
# @create = 2015/07/31

'''
43. 名詞を含む文節が動詞を含む文節に係るものを抽出

名詞を含む文節が，
動詞を含む文節に係るとき，
これらをタブ区切り形式で抽出せよ．
ただし，句読点などの記号は出力しないようにせよ．
'''

import knock41

chunks_list = knock41.knock41()

for chunks in chunks_list:
    for index in range(len(chunks)):
        try:
            pre = '名詞' in [morph.pos for morph in chunks[index].morphs]
            suf = '動詞' in [morph.pos for morph in chunks[index+1].morphs]
            if pre and suf:
                for morph in chunks[index].morphs:
                    print morph.surface,
                for morph in chunks[index+1].morphs:
                    if morph.pos != '記号': print morph.surface,
                print ""
        except:
            continue
