function transcribe_DNA_to_RNA(file::AbstractString, out::AbstractString)
  DNA_string = uppercase(readall(file))
  RNA_string = ""

  for i = 1:endof(DNA_string)
    if DNA_string[i] == 'T'
      RNA_string = string(RNA_string, 'U')
    else
      RNA_string = string(RNA_string, DNA_string[i])
    end
  end
  output_file = ARGS[2]
  out_file = open(output_file, "w")
  write(out_file, RNA_string)
  close(out_file)
end

transcribe_DNA_to_RNA(ARGS[1], ARGS[2])
