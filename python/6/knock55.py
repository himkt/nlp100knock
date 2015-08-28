# -*- coding: utf-8 -*-
# @author = himkt
# @create = 2015/08/03

'''
55. 固有表現抽出

入力文中の人名をすべて抜き出せ．
'''

import xml.etree.ElementTree as ET

def knock55():

    tree      = ET.parse('../data/nlp.xml')
    root      = tree.getroot()
    tokens    = root.findall("./document/sentences/sentence/tokens/token")
    
    return [[item.text for item in token if item.tag in ['word', 'NER']] for token in tokens]

    '''
    for token in tokens:
        element = [item.text for item in token if item.tag in ['word', 'lemma', 'POS']]
        print "\t".join(element)
    '''

if __name__ == '__main__':
    results = knock55()
    for result in results:
        if result[1] == 'PERSON': print "\t".join(result)
