# -*- coding: utf-8 -*-

"""
46. 動詞の格フレーム情報の抽出

45のプログラムを改変し，述語と格パターンに続けて項（述語に係っている文節そのもの）をタブ区切り形式で出力せよ．45の仕様に加えて，以下の仕様を満たすようにせよ．

項は述語に係っている文節の単語列とする（末尾の助詞を取り除く必要はない）
述語に係る文節が複数あるときは，
助詞と同一の基準・順序でスペース区切りで並べる
「吾輩はここで始めて人間というものを見た」という例文（neko.txt.cabochaの8文目）を考える．
この文は「始める」と「見る」の２つの動詞を含み，
「始める」に係る文節は「ここで」，
「見る」に係る文節は「吾輩は」と「ものを」と解析された場合は，
次のような出力になるはずである．
"""

from knock41 import parse


if __name__ == '__main__':
    document = parse()
    sentence = document[7]

    # for sentence in document:
    for chunk in sentence:
        if '動詞' in [m.pos for m in chunk.morphs]:

            # We treat verb as a predicate
            predicate = [m.base for m in chunk.morphs if m.pos == '動詞'][0]
            arguments = []

            for src in chunk.srcs:
                if '助詞' in [m.pos for m in sentence[src].morphs]:
                    argument = sentence[src].get_text()
                    case = [m.base for m in sentence[src].morphs if m.pos == '助詞'][-1]
                    arguments.append((case, argument))

            if arguments:
                arguments.sort()
                print("%s\t%s\t%s" % (predicate, ' '.join([a[0] for a in arguments]), ' '.join([a[1] for a in arguments])))

