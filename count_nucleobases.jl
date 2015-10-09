function count_nucleobases(file::AbstractString)
  # Reads in file as one long string, converts to uppercase
  DNA_string = uppercase(readall(file))

  a = c = g = t = 0
  println("a c g t")

  #  Goes through the string counting each nucleobase, resetting at each
  # newline and printing current count.
  for i = 1:endof(DNA_string)
    if DNA_string[i] == 'A'
      a += 1
    elseif DNA_string[i] == 'C'
      c += 1
    elseif DNA_string[i] == 'G'
      g += 1
    elseif DNA_string[i] == 'T'
      t += 1
    elseif DNA_string[i] == '\n'
      println(a, " ", c, " ", g, " ", t)
      a = c = g = t = 0
    end
  end
  # Catch case of a one line file
  if a > 0 || c > 0 || g > 0 || t > 0
    println(a, " ", c, " ", g, " ", t)
  end
end

count_nucleobases(ARGS[1])
