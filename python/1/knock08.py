# -*- coding: utf-8 -*-
import re

str1 = raw_input()

def cipher(string):
	
    str2 = ''
    for char in str1:
        str2 += chr(219-ord(char)) if re.search(r"[a-z]",char) else char
        
    '''
    if re.search(r"[a-z]", char):
        str2 += chr(219 - ord(char))
    else:
        str2 += char
    '''
		
    return str2


print cipher(str1)
