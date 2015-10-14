function dna_complement(instring::AbstractString)
  dna_string = uppercase(instring)
  complement_string = ""

  for i in 1:endof(dna_string)
    if dna_string[i] == 'A'
      complement_string = string(complement_string, 'T')
    elseif dna_string[i] == 'T'
      complement_string = string(complement_string, 'A')
    elseif dna_string[i] == 'G'
      complement_string = string(complement_string, 'C')
    elseif dna_string[i] == 'C'
      complement_string = string(complement_string, 'G')
    end
  end

  return(complement_string)
end

function rna_complement(instring::AbstractString)
  rna_string = uppercase(instring)
  complement_string = ""

  for i in 1:endof(rna_string)
    if rna_string[i] == 'A'
      complement_string = string(complement_string, 'U')
    elseif rna_string[i] == 'U'
      complement_string = string(complement_string, 'A')
    elseif rna_string[i] == 'G'
      complement_string = string(complement_string, 'C')
    elseif rna_string[i] == 'C'
      complement_string = string(complement_string, 'G')
    end
  end

  return(complement_string)
end
