#!/bin/bash

#installation wizard 

#create python venv
python3 -m venv env/KaML

#activate it
source env/KaML/bin/activate

#update pip
pip install -U pip

#install reqs
pip install numpy torch esm tqdm httpx colorama

#download wts from zenodo
mkdir env/wts
cd env/wts

#KaML-ESM2
echo "Fetching ESM2 weights: this could take a few minutes"
wget https://zenodo.org/records/18397706/files/esm2.tar.gz
echo "Extracting ESM2 weights: this could take a few minutes"
tar -xf esm2.tar.gz

#KaML-ESMC
echo "Fetching ESMC weights: this could take a few minutes"
wget https://zenodo.org/records/18407675/files/esmC.tar.gz
echo "Extracting ESMC weights: this could take a few minutes"
tar -xf esmC.tar.gz
mv home/wayyne/lab/kaml/wts/esmC .
rm -rf home/wayyne/lab/kaml/wts

#CBTree2
echo "Fetching CBtree2 weights: this could take a few minutes"
wget https://zenodo.org/records/18392532/files/CBtree2.tar.gz
echo "Extracting CBtree2 weights: this could take a few minutes"
tar -xf CBtree2.tar.gz

#housekeeping
echo "Peforming housekeeping"
rm esmC.tar.gz
rm esm2.tar.gz
rm CBtree2.tar.gz
