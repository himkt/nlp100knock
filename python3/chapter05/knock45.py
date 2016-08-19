# -*- coding: utf-8 -*-

"""
45. 動詞の格パターンの抽出
今回用いている文章をコーパスと見なし，
日本語の述語が取りうる格を調査したい．
動詞を述語，動詞に係っている文節の助詞を格と考え，
述語と格をタブ区切り形式で出力せよ．
ただし，出力は以下の仕様を満たすようにせよ．

動詞を含む文節において，最左の動詞の基本形を述語とする
述語に係る助詞を格とする
述語に係る助詞（文節）が複数あるときは，
すべての助詞をスペース区切りで辞書順に並べる
「吾輩はここで始めて人間というものを見た」という例文（neko.txt.cabochaの8文目）を考える．
この文は「始める」と「見る」の２つの動詞を含み，
「始める」に係る文節は「ここで」，
「見る」に係る文節は「吾輩は」と「ものを」と解析された場合は，
次のような出力になるはずである．
"""

from knock41 import parse


if __name__ == '__main__':
    document = parse()
    # sentence = document[7]

    for sentence in document:
        for chunk in sentence:
            if '動詞' in [m.pos for m in chunk.morphs]:

                # We treat least left verb as a predicate
                predicate = [m.base for m in chunk.morphs if m.pos == '動詞'][0]

                case_list = []
                for src in chunk.srcs:
                    if '助詞' in [m.pos for m in sentence[src].morphs]:
                        case = [m.base for m in sentence[
                            src].morphs if m.pos == '助詞'][-1]
                        case_list.append(case)

                if len(case_list) > 0:
                    case_list.sort()
                    print('%s\t%s' % (predicate, ' '.join(case_list)))
