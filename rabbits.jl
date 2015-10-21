function rabbits(no_of_months::Integer, no_per_litter::Integer)
  previous_count = 1
  current_count = 1

  if no_of_months < 3
    if no_of_months >= 1
      return 1
    else
      return 0
    end
  end

  for i in 3:no_of_months
    temp = previous_count
    previous_count = current_count
    current_count += temp*no_per_litter
  end

  return current_count
end

# can't use the rabbits function because it doesn't accurately show the count
# with a finite lifetime, have to recursively call itself must be rewritten
function mortal_rabbits(no_of_months::Integer, lifespan_in_months::Integer)
  previous_count = 1
  current_count = 1

  if no_of_months < 3
    if no_of_months >= 1
      return 1
    else
      return 0
    end
  end

  count_history = Array{Integer}(no_of_months)
  count_history[1] = 1
  count_history[2] = 1

  for i in 3:no_of_months
    temp = previous_count
    previous_count = current_count
    if i <= lifespan_in_months - 2
      current_count += temp
      count_history[i] = current_count
    else
      current_count += temp - count_history[i - lifespan_in_months - 1]
      count_history[i] = current_count
    end
  end

  return current_count
end
