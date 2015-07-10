# -*- coding: utf-8 -*-

'''
文字列"stressed"の文字を逆に
（末尾から先頭に向かって）
並べた文字列を得よ．
'''

line = raw_input()

print line[::-1]

list_line = list(line)
list_line.reverse()
print ''.join(list_line)
