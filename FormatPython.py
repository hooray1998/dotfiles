# -*- coding:utf-8 -*-
from yapf.yapflib.yapf_api import FormatFile
import sys

for line in FormatFile(sys.argv[1]):
    print(line)
isFormat = input("输入是否格式化[y/n]:")
if isFormat == 'y':
    FormatFile(sys.argv[1],in_place='True')
    print("FormatFile is successful.")
