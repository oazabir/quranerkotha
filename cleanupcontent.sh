[[ -n "$1" ]] && FOLDER=$1 || FOLDER=./docs/
for line in $(find $FOLDER -iname '*.html'); do 
   echo "$line"
   ls -l "$line"
	 tidy -e -utf8 -im -asxhtml -q "$line"

	 xsltproc --novalid --html --encoding UTF8 sanitize.xslt "$line" > "$line.out"
	 tidy -e -utf8 -im -asxhtml -q "$line.out"

   	cmp --silent "$line" "$line.out" || cp -f "$line.out" "$line"
	 rm "$line.out"
done
sedi () {
    sed --version >/dev/null 2>&1 && sed -i -- "$@" || sed -i "" "$@"
}
find $FOLDER -name '*.html' | while read file
do 
	sedi 's/<?xml version="4.0" encoding="UTF8"??>//' "$file"
	sedi 's/https:\/\/quranerkotha.com//' "$file"
	sedi 's/http:\/\/quranerkotha.com//' "$file"
	sedi 's/&#13;//' "$file"
	sedi 's/�|�্//' "$file"
done
