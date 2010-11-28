fib := method(offset,
  window := list(1, 1)
  for(i, 1, offset - 2, window = list(window at(1), (window at(0) + window at(1))))
  window at(1)
)

fib(1)  println
fib(2)  println
fib(3)  println
fib(4)  println
fib(44) println
