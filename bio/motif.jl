function find_motif(string::AbstractString, substring::AbstractString)
  if substring > string
    return error("Substring longer than searchable string")
  end

  for index in 1:length(string)-length(substring)
    if substring == string[index:index+length(substring)-1]
      print(index, " ")
    end
  end
  print("\n")
end

function find_motif(string::AbstractString, check::Function)

  for index in 1:length(string)-3
    if check(string[index:index+3])
      print(index, " ")
    end
  end
  print("\n")
end

function N_glycosylation_motif(string::AbstractString)
  if length(string) != 4
    return error("Not a proper sequence segment")
  end

  if string[1] == 'N'
    if string[2] != 'P'
      if string[3] == 'S' || string[3] == 'T'
        if string[4] != 'P'
          return true
        end
      end
    end
  end

  return false
end
