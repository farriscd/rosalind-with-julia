# takes a string as an argument and uses that as a filename
# TODO: should be rewritten to either take ARGS[] for standalone uses
# or adapt to be used in a main file

function read_fasta(file::AbstractString)

  # Check to find how many sequences in the file based on the FASTA
  # format of beginning each name line with a '>' character
  infile = open(file, "r")
  index_max = count(x -> x == '>', readall(infile))
  fasta = Array{AbstractString}(index_max, 2)

  # If there are no sequences, or the file is not formatted
  # properly throw out this error
  if index_max <= 0
    return error("Not a proper FASTA formatted file")
  end

  # Initializing variables
  infile = open(file, "r")
  index = 1
  indentifier = ""
  sequence = ""

  # Reads to the first name in the file
  readuntil(infile, ">")
  identifier = sequence_name(readline(infile))
  fasta[index, 1] = identifier

  # Scans file line by line, reading and sorting into an array
  for ln in eachline(infile)
    if startswith(ln, '>')
      index += 1
      sequence = ""
      identifier = sequence_name(ln[2:endof(ln)])
      fasta[index, 1] = identifier
    else
      sequence = string(sequence, sequence_body(ln))
      fasta[index, 2] = sequence
    end
  end

  # Returns the file as a 2 dimensional array, with the first
  # column filled by sequence names, and the sequence itself
  # stored in the second column.
  return fasta
end

# both of these were made separate functions for possible future expansion
# cleans off the cruft around the sequence name
function sequence_name(ln::AbstractString)
  return ln[1:(search(ln, ' ') != 0 ? search(ln, ' ') : endof(ln))-1]
end

# removes the newline characters from the sequence string
function sequence_body(ln::AbstractString)
  return replace(ln, "\n", "")
end
