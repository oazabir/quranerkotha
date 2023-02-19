ROOT=.
[[ -z $1 ]] && echo "Specify folder name" && exit 1
ARTICLE=$1
./updatecontent.sh $ARTICLE
./updatecontent.sh index
cp ${ROOT}/index/index.html ${ROOT}/
git add ${ROOT}/$ARTICLE
git add ${ROOT}/index/index.html
git add ${ROOT}/index.html
git add ${ROOT}/wp-content/uploads
git status
git commit -m "$ARTICLE added"

