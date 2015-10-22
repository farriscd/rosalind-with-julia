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

function count_cg_content(instring::AbstractString)
  dna_string = uppercase(instring)
  counts = count_nucleotides(dna_string)

  cg_percent = (counts[2] + counts[3]) / (counts[1] + counts[2] + counts[3] + counts[4])

  return cg_percent*100
end

function highest_cg_content(fasta_array::Array)

  number_of_entries = Integer(length(fasta_array)/2)
  if length(fasta_array) > 0
  else
    return error("Not properly formatted fasta array")
  end

  cg_content_array = Array{Float64}(number_of_entries)

  for index in 1:number_of_entries
    cg_content_array[index] = count_cg_content(fasta_array[index,2])
  end

  highest_cg_content = findmax(cg_content_array)
  println(fasta_array[highest_cg_content[2],1], " ", highest_cg_content[1])
end
