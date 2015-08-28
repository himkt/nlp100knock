# -*- coding: utf-8 -*-
# @author = himkt
# @create = 2015/07/20

'''
29. 国旗画像のURLを取得する

テンプレートの内容を利用し，
国旗画像のURLを取得せよ．
（ヒント: MediaWiki APIのimageinfoを呼び出して，
ファイル参照をURLに変換すればよい）
'''

import re

template = {}
flag = False


def remove_internal_link(line):

    # if the line have more internal links
    if re.search(r"\[\[(.*)\]\]", line):
        
        if re.search(r"\[\[(.*?)\|(.*?)\]\]", line):

            line = re.sub(r"\[\[.*\|(.*?)\]\]", "\\1", line)

        else:

            line = re.sub(r"\[\[(.*?)\]\]", '\\1', line)

        return remove_internal_link(line)

    else:
        
        return line

for line in open('../data/jawiki-country-uk.txt', 'r'):
    
    line = line.replace('\'', '')

    # internal link
    # TODO: recursive call a function to remove links from a sentense

    line = remove_internal_link(line)

    if re.search(r"^{{基礎情報", line):
        flag = True
        continue

    if re.search(r"^}}", line):
        break
    
    if flag:
        reg = re.search(r"\|(.*?)\s=\s(.*)", line)
        
        if reg:

            elements = reg.groups()
            template[elements[0]] = elements[1]

        else:

            template[elements[0]] += line



print "URL: https://en.wikipedia.org/wiki/File:%s" % template["国旗画像"]
