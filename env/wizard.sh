#!/bin/bash

#installation wizard 

#create python venv
python3 -m venv KaML

#activate it
source KaML/bin/activate

#update pip
pip install -U pip

#install reqs
pip install numpy torch esm tqdm httpx colorama

#download wts from zenodo
cd wts

#ligcysS
echo "Fetching ESM2 weights: this could take a few minutes"
wget https://zenodo.org/records/17693548/files/ligcysS_v1.tar.xz
echo "Extracting ESM2 weights: this could take a few minutes"
tar -xJf ligcysS_v1.tar.xz

#ligcysA
echo "Fetching ESMC weights: this could take a few minutes"
wget https://zenodo.org/records/17693548/files/ligcysA_v1.tar.xz
echo "Extracting ESMC weights: this could take a few minutes"
tar -xJf ligcysA_v1.tar.xz

#ligbind
echo "Fetching CBtree2 weights: this could take a few minutes"
wget https://zenodo.org/records/17693713/files/ligbind_v1.tar.xz
echo "Extracting CBtree2 weights: this could take a few minutes"
tar -xJf ligbind_v1.tar.xz

#housekeeping
echo "Peforming housekeeping"
rm ligcysS_v1.tar.xz
rm ligcysA_v1.tar.xz
rm ligbind_v1.tar.xz
rm ssbind_v1.tar.xz
rm znbind_v1.tar.xz
