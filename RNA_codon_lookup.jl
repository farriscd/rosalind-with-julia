function RNA_codon_index(nucleobase::AbstractString)
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

function RNA_codon_table(index1::Integer, index2::Integer, index3::Integer)
  RNA_codon_table = Array{AbstractString}(4, 4, 4)
  RNA_codon_table[:,:,1] = ["F" "S" "Y" "C" ; "L" "P" "H" "R" ;
                            "I" "T" "N" "S" ; "V" "A" "D" "G" ]
  RNA_codon_table[:,:,2] = ["F" "S" "Y" "C" ; "L" "P" "H" "R" ;
                            "I" "T" "N" "S" ; "V" "A" "D" "G" ]
  RNA_codon_table[:,:,3] = ["L" "S" "\n" "\n" ; "L" "P" "Q" "R" ;
                            "I" "T" "K" "R" ; "V" "A" "E" "G" ]
  RNA_codon_table[:,:,4] = ["L" "S" "\n" "W" ; "L" "P" "Q" "R" ;
                            "M" "T" "K" "R" ; "V" "A" "E" "G" ]
  return RNA_codon_table[index1, index2, index3]
end

function RNA_codon_lookup(RNA_string::AbstractString)
  protein_string = ""
  for i = 1:3:endof(RNA_string)
    if i+2 < endof(RNA_string)
      protein_string = string(protein_string, RNA_codon_table(RNA_codon_index(RNA_string[i:i]), RNA_codon_index(RNA_string[i+1:i+1]), RNA_codon_index(RNA_string[i+2:i+2])))
    end
  end
  return(protein_string)
end
