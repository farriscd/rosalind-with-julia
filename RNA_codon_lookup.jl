function rna_codon_index(nucleobase::AbstractString)
  if nucleobase == "U"
    return 1
  elseif nucleobase == "C"
    return 2
  elseif nucleobase == "A"
    return 3
  elseif nucleobase == "G"
    return 4
  end
end

function rna_codon_table(index1::Integer, index2::Integer, index3::Integer)
  rna_codon_table = Array{AbstractString}(4, 4, 4)
  rna_codon_table[:,:,1] = ["F" "S" "Y" "C" ; "L" "P" "H" "R" ;
                            "I" "T" "N" "S" ; "V" "A" "D" "G" ]
  rna_codon_table[:,:,2] = ["F" "S" "Y" "C" ; "L" "P" "H" "R" ;
                            "I" "T" "N" "S" ; "V" "A" "D" "G" ]
  rna_codon_table[:,:,3] = ["L" "S" "\n" "\n" ; "L" "P" "Q" "R" ;
                            "I" "T" "K" "R" ; "V" "A" "E" "G" ]
  rna_codon_table[:,:,4] = ["L" "S" "\n" "W" ; "L" "P" "Q" "R" ;
                            "M" "T" "K" "R" ; "V" "A" "E" "G" ]
  return rna_codon_table[index1, index2, index3]
end

function rna_codon_lookup(rna_string::AbstractString)
  protein_string = ""
  for i = 1:3:endof(rna_string)
    if i+2 < endof(rna_string)
      protein_string = string(protein_string, rna_codon_table(rna_codon_index(rna_string[i:i]), rna_codon_index(rna_string[i+1:i+1]), rna_codon_index(rna_string[i+2:i+2])))
    end
  end
  return(protein_string)
end
