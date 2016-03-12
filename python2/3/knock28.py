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

def remove_external_link(line):
    if(re.search(u'\[http', line)):
        line = re.sub(u'\[http.*? (.*)\]', '\\1', line)
    return line

def remove_language_tags(line):
    if(re.search(u'{{lang\|', line)):
        line = re.sub(u'{{lang\|\w\w\w?\|(.*?)}}(.*)$', '\\2 \\1', line)
        return remove_language_tags(line)
    else:
        return line

def remove_html_tags(line):
    line = re.sub(u'<.*?>(.*?)<\/.*?>', '\\1', line)
    line = re.sub(u'<.*? \/>', '', line)
    line = re.sub(u'<br\/>', '', line)
    line = re.sub(u'<\/?ref>', '', line)
    return line

for line in open('../data/jawiki-country-uk.txt', 'r'):
    line = line.replace('\'', '')

    # internal link
    # TODO: recursive call a function to remove links from a sentense

    line = remove_internal_link(line)
    line = remove_external_link(line)
    line = remove_language_tags(line)
    line = remove_comment(line)
    line = remove_html_tags(line)

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
