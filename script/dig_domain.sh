#! /bin/bash
while read LINE; do
  dig +noall +answer $LINE
done < dig.txt
# dig.txt la file list domain
