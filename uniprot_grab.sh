#!/bin/bash

if [ -f "$1"] ; then
  grep . $1 | while read -r line ; do
    curl -OL "http://www.uniprot.org/uniprot/$line.fasta"
  done
else
  curl -OL "http://www.uniprot.org/uniprot/$1.fasta"
fi
