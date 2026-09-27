import hashlib
import sys

file = "C:\\Users\\guigui0246-EPITECH\\Downloads\\poptracker\\packs\\albw-ap-poptracker.zip"

if len(sys.argv) > 1:
    file = sys.argv[1]

with open(file, "rb") as f:
    bytes = f.read()  # read entire file as bytes
    readable_hash = hashlib.sha256(bytes).hexdigest()
    print(readable_hash.upper())
