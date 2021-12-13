ROOT=cleaned
DOWNLOAD_FOLDER=quranerkotha.com
rm -rf ${DOWNLOAD_FOLDER} || mkdir -p ${DOWNLOAD_FOLDER}
# Reap latest content from website
#wget -E -U mozilla -r --convert-links -nc --user-agent "Mozilla/5.0 (Linux; Android 4.0.4; Galaxy Nexus Build/IMM76B) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.133 Mobile Safari/535.19" --domains=quranerkotha.com --exclude-directories=tag,category,amp,feed,page,author --reject-regex "reply|feed/|amp/|robots.txt" https://quranerkotha.com/index/
#wget -E -U mozilla -r -nc --user-agent "Mozilla/5.0 (Linux; Android 4.0.4; Galaxy Nexus Build/IMM76B) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.133 Mobile Safari/535.19" --domains=quranerkotha.com --ignore-tags=link,script --exclude-directories=tag,category,amp,feed,page,author,pdf,wp-includes,wp-json --reject-regex "feed/|amp/|reply|robots.txt|(.*)\?(.*)" https://quranerkotha.com/index/

wget -E -U mozilla -r -nc --user-agent "Mozilla/5.0 (Linux; Android 4.0.4; Galaxy Nexus Build/IMM76B) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.133 Mobile Safari/535.19" --domains=quranerkotha.com --ignore-tags=link,script --exclude-directories=tag,category,amp,feed,page,author,pdf,wp-includes,wp-json --accept-regex ".*/$|(/)(/.*/)index.html$" https://quranerkotha.com/index/


cp -r ${DOWNLOAD_FOLDER}/* ${ROOT}/
./cleanupcontent.sh ${ROOT}

# mkdir -p ${ROOT}/wp-content/
cp -r ./themes ${ROOT}/wp-content/ 

# move the index page to root
cp ${ROOT}/index/index.html ${ROOT}/index.html
