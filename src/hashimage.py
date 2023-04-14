#!/usr/bin/env python3

from PIL import Image
import hashlib
import sys

im = Image.open(sys.argv[1])
image_hash = hashlib.sha256(im.tobytes()).hexdigest()
print(image_hash)

# with open('img/hash.txt', 'r') as f:
# 	data = f.read()

# if data == image_hash:
# 	print('[+] matches')
# else:
# 	print('[-] image change detected:', data, '!=', image_hash)

# with open('img/hash.txt', 'w') as f:
# 	f.write(image_hash)


