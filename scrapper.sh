#!/bin/sh
mkdir -p web-scrapper #create a parent directory as necessary
cd web-scrapper
echo "Paste your url"
read link
wget -q $link
cd ..
grep -r -Po -h '(?<=href=")[^"]*' web-scrapper/ >links_temp.csv
grep "^http" links_temp.csv >links_temp_filtered.csv
sort -u links_temp_filtered.csv > links.csv
rm -rf web-scrapper links_temp.csv links_temp_filtered.csv