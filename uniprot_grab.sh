#!/bin/bash

grep . $1 | while read -r line ; do
  curl -OL "http://www.uniprot.org/uniprot/$line.fasta"
done
