set -e

npm run build

cd dist 

git init 
git add -A
git commit -m "finish"

git push -f  "https://github.com/xouoe/vue-todolist.git" master:gh-pages

cd -