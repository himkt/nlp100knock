# -*- coding: utf-8 -*-
# @author = himkt
# @create = 2015/07/20

'''
28. MediaWikiマークアップの除去

27の処理に加えて，
テンプレートの値からMediaWikiマークアップを可能な限り除去し，
国の基本情報を整形せよ．
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

def remove_comment(line):

    return re.sub(r"<\!--(.*)-->", "\\1", line)


for line in open('../data/jawiki-country-uk.txt', 'r'):
    
    line = line.replace('\'', '')

    # internal link
    # TODO: recursive call a function to remove links from a sentense

    line = remove_internal_link(line)
    line = remove_comment(line)

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

for key, value in template.items():

    print "%s = %s" % (key, value)
