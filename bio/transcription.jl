function transcribe(instring::AbstractString)
  dna_string = uppercase(instring)
  rna_string = ""

  for i in 1:endof(dna_string)
    if dna_string[i] == 'T'
      rna_string = string(rna_string, 'U')
    else
      rna_string = string(rna_string, dna_string[i])
    end
  end

  return(rna_string)
end

function reverse_transcribe(instring::AbstractString)
  rna_string = uppercase(instring)
  dna_string = ""

  for i in 1:endof(rna_string)
    if rna_string[i] == 'U'
      dna_string = string(dna_string, 'T')
    else
      dna_string = string(dna_string, rna_string[i])
    end
  end

  return(dna_string)
end
