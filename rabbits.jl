function rabbits(n::Integer, k::Integer)
  m1 = 1
  m2 = 1
  println(m1)
  println(m2)
  for i in 3:n
    temp = m1
    m1 = m2
    m2 += temp*k
    println(m2)
  end
end
