#!/bin/bash

#installation wizard 

#create python venv
python3 -m venv env/KaML

#patch activate: ensure repo ./bin is on PATH (for rida, mkdssp, etc.)
ACTIVATE="env/KaML/bin/activate"
if ! grep -q "KaML-ESM: add repo bin to PATH" "$ACTIVATE"; then
cat >> "$ACTIVATE" <<'EOF'

# --- KaML-ESM: add repo bin to PATH (for rida, mkdssp, etc.) ---
# Repo layout: <repo>/env/KaML is the venv, so repo root is two dirs above $VIRTUAL_ENV.
_kaml_repo_root="$(cd "${VIRTUAL_ENV}/../.." && pwd)"
if [ -d "${_kaml_repo_root}/bin" ] ; then
    export PATH="${_kaml_repo_root}/bin:${PATH}"
fi
unset _kaml_repo_root
EOF
fi

#activate it
source env/KaML/bin/activate

#update pip
pip install -U pip

#install reqs
cd env
pip install -r KaML-ESM_env.txt

#download wts from zenodo
mkdir wts
cd wts

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
mv home esmC_tmp
mv esmC_tmp/wayyne/lab/kaml/wts/esmC .
rm -rf esmC_tmp

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
