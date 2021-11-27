serve:
	echo -e "$(find ./content -print)\n./generate.sh" | entr -sc './generate.sh'

final:
	./generate.sh
