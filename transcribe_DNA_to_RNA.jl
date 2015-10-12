function transcribe_DNA_to_RNA(DNA_string::AbstractString)
  DNA_string = DNA_string
  RNA_string = ""

  for i = 1:endof(DNA_string)
    if DNA_string[i] == 'T'
      RNA_string = string(RNA_string, 'U')
    else
      RNA_string = string(RNA_string, DNA_string[i])
    end
  end
  println(RNA_string)
end
