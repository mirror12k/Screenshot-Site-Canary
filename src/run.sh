#!/bin/bash

set -e



function run_hasher {
	node src/code.js "$URL" "img/${PROJECT_KEY}_screenshot.png"

	TODAY=$(date +"%y.%m.%d-%H.%M")
	cp "img/${PROJECT_KEY}_screenshot.png" "img/${PROJECT_KEY}_screenshot_$TODAY.png"
	imgp -x 64x64 "img/${PROJECT_KEY}_screenshot.png" -w
	img_hash=$(./src/hashimage.py "img/${PROJECT_KEY}_screenshot.png")
	echo "[i] img_hash: $img_hash"

	if [[ -e "img/${PROJECT_KEY}_lasthash.txt" ]]; then
		previous_hash=$(cat "img/${PROJECT_KEY}_lasthash.txt")
		if [[ "$img_hash" == "$previous_hash" ]]; then
		    echo "[+] hash match for $PROJECT_KEY"
		else
		    echo "[+] hashes dont match for $PROJECT_KEY : $img_hash vs $previous_hash"
		fi
	fi

	echo -n "$img_hash" > "img/${PROJECT_KEY}_lasthash.txt"
}


while read line; do
  # echo "line $line"
  PROJECT_KEY=$(echo $line | cut -d " " -f 1)
  URL=$(echo $line | cut -d " " -f 2)
  echo "processing: $PROJECT_KEY -> $URL"
  run_hasher
done < config.txt





