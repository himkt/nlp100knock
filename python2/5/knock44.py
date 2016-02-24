# -*- coding: utf-8 -*-
# @author = himkt
# @create = 2015/08/10

'''
44. 係り受け木の可視化

与えられた文の係り受け木を有向グラフとして可視化せよ．
可視化には，係り受け木をDOT言語に変換し，
Graphvizを用いるとよい．
また，Pythonから有向グラフを直接的に可視化するには，
pydotを使うとよい．
'''

import knock41
import knock42
import re

chunks_list = knock41.knock41()
chunks = chunks_list[8]

'''
 digraph graphname {
    a -> b -> c;
    b -> d;
}
'''

print "digraph dependency{"

for phrase in knock42.knock42(chunks):
    print "    %s;" % re.sub('\t', ' -> ', phrase)

print "}"
