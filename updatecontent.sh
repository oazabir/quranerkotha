set -x
FOLDER=$1
ROOT=.
# Drop existing folder
rm -rf ${ROOT}/$FOLDER

# Reap latest content from website
#wget -E -U mozilla --include-directories=$FOLDER,wp-content/uploads -l1 -r --convert-links --user-agent "Mozilla/5.0 (Linux; Android 4.0.4; Galaxy Nexus Build/IMM76B) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.133 Mobile Safari/535.19" --domains=quranerkotha.com --exclude-directories=tag,category,amp,feed --reject-regex "reply|.pdf|feed|amp|fbicon.png|robots.txt" https://quranerkotha.com/$FOLDER/
wget -E -U mozilla -r -nc --user-agent "Mozilla/5.0 (Linux; Android 4.0.4; Galaxy Nexus Build/IMM76B) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.133 Mobile Safari/535.19" --domains=quranerkotha.com --ignore-tags=link,script --exclude-directories=tag,category,amp,feed,page,author,pdf,wp-includes,wp-json --accept-regex ".*/$|(/)(/.*/)index.html$" https://quranerkotha.com/$FOLDER/
# Delete all diff resolution files
#rm ${ROOT}/wp-content/uploads/*/*/*-*x*.png
#rm ${ROOT}/wp-content/uploads/*/*/*-*x*.jpg

# Delete useless folders
#find ${ROOT}/$FOLDER/ -type d -name 'feed' -exec rm -rf {} \;
#find ${ROOT}/$FOLDER/ -type d -name 'amp' -exec rm -rf {} \;

sedi () {
    sed --version >/dev/null 2>&1 && sed -i -- "$@" || sed -i "" "$@"
}
#sedi  's/-150x150.png/.png/g' '${ROOT}/index/index.html'
#sedi  's/-150x150.jpg/.jpg/g' '${ROOT}/index/index.html'

./cleanupcontent.sh ${ROOT}/$FOLDER/

