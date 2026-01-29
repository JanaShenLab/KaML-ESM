#!/bin/bash

#installation wizard 

#create python venv
python3 -m venv KaML-ESM

#activate it
source KaML-ESM/bin/activate

#update pip
pip install -U pip

#install reqs
pip install numpy torch esm tqdm httpx colorama

#download wts from zenodo
cd wts

#KaML-ESM2
echo "Fetching ESM2 weights: this could take a few minutes"
wget https://zenodo.org/records/18397706/files/esm2.tar.gz
echo "Extracting ESM2 weights: this could take a few minutes"
tar -xJf esm2.tar.xz

#KaML-ESMC
echo "Fetching ESMC weights: this could take a few minutes"
wget https://zenodo.org/records/18407675/files/esmC.tar.gz
echo "Extracting ESMC weights: this could take a few minutes"
tar -xJf esmC.tar.gz

#CBTree2
echo "Fetching CBtree2 weights: this could take a few minutes"
wget https://zenodo.org/records/18392532/files/CBtree2.tar.gz
echo "Extracting CBtree2 weights: this could take a few minutes"
tar -xJf CBtree2.tar.xz

#housekeeping
echo "Peforming housekeeping"
rm esmC.tar.gz
rm esm2.tar.gz
rm CBtree2.tar.gz
