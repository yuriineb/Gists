#!/system/bin/sh

apt update && apt upgrade
git clone https://github.com/Dionach/CMSmap
cd CMSmap/
rm -rf .git .github/ .gitignore DISCLAIMER.txt LICENSE.txt
mv README.md README.txt
chmod +x cmsmap.py -h
python3 cmsmap.py -h
