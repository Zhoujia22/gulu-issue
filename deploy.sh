rm -rf dist &&
yarn build &&
cd dist &&
git init &&
git add . &&
git commit -m "update" &&
git branch -M main &&
git remote add origin git@github.com:Zhoujia22/jing-ui-website.git &&
git push -f -u origin main &&
cd ..
echo https://zhoujia22.github.io/jing-ui-website/index.html