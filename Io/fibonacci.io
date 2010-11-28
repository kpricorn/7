"loop" println

fib := method(offset,
  window := list(0, 1)
  for(i, 1, offset, window = list(window at(1), (window at(0) + window at(1))))
  window at(0)
)

fib(0)  println
fib(1)  println
fib(2)  println
fib(3)  println
fib(4)  println
fib(44) println

"recursion" println

fib = method(offset, index, window,
  index ifNil(index = 0)
  window ifNil(window = list(0, 1))
  ret := if(offset == index, return window at(0), fib(offset, index+1, list(window at(1), (window at(0) + window at(1)))))
)

list(0, fib(0))  println
list(1, fib(1))  println
list(2, fib(2))  println
list(3, fib(3))  println
list(4, fib(4))  println
list(44, fib(44)) println
