function count_nucleotides(instring::AbstractString)
  dna_string = uppercase(instring)
  adenine = cytosine = guanine = thymine = 0

  for i in 1:endof(dna_string)
    if dna_string[i] == 'A'
      adenine += 1
    elseif dna_string[i] == 'C'
      cytosine += 1
    elseif dna_string[i] == 'G'
      guanine += 1
    elseif dna_string[i] == 'T'
      thymine += 1
    end
  end

  return(adenine, cytosine, guanine, thymine)
end
