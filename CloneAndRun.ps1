cd ..
Remove-Item office-sign -Recurse
git clone https://github.com/GArysTrousers/office-sign.git
cd ./office-sign
npm i
npm run build
node ./build