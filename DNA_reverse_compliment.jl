function DNA_reverse_compliment(string::AbstractString)
  DNA_string = uppercase(string)
  reverse_compliment_string = ""

  for i = endof(DNA_string):-1:1
    if DNA_string[i] == 'A'
      reverse_compliment_string = string(reverse_compliment_string, 'T')
    elseif DNA_string[i] == 'C'
      reverse_compliment_string = string(reverse_compliment_string, 'G')
    elseif DNA_string[i] == 'G'
      reverse_compliment_string = string(reverse_compliment_string, 'C')
    elseif DNA_string[i] == 'T'
      reverse_compliment_string = string(reverse_compliment_string, 'A')
    else DNA_string[i] == '\n'
      reverse_compliment_string = string(reverse_compliment_string, '\n')
    end
  end
  println(reverse_compliment_string)
end
