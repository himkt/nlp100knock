# -*- coding: utf-8 -*-

"""
44. 係り受け木の可視化

与えられた文の係り受け木を有向グラフとして可視化せよ．
可視化には，係り受け木をDOT言語に変換し，
Graphvizを用いるとよい．
また，Pythonから有向グラフを直接的に可視化するには，pydotを使うとよい．
"""

from knock41 import parse


if __name__ == '__main__':
    document = parse()
    sentence = document[7]
    print("digraph graphname {")

    for chunk in sentence:
        if chunk.dst != -1:
            if chunk.get_text() != '':

                print("  \"%s\" -> \"%s\";" % (
                    chunk.get_text(), sentence[chunk.dst].get_text()
                ))

    print("}")
