
test "Pipe to function", ->

  fn = (x) -> x * 100

  eq 100, (1 |> fn)
  eq 300, (3 |> fn)

test "Pipe to partialy filled function", ->

  fn = (x,y) -> "#{x},#{y}"

  eq '1,2', (2 |> fn(1, __))
  eq '1,2', (2 |> fn 1, __)

test "Pipe chain", ->

  f = (x) -> x * 10
  g = (x) -> x + 5

  eq 15, (1 |> f |> g)
  eq 60, (1 |> g |> f)

  add = (x,y) -> x + y
  mul = (x,y) -> x * y

  eq 45, (4 |> mul(10, __) |> add 5, __)
  eq 70, (4 |> add(10, __) |> mul 5, __)

test "Pipe on the next line", ->

  fn = (x,y) -> "#{x},#{y}"

  r = 2
    |> fn(1, __)
  eq '1,2', r

  eq '1,2', (2
    |> fn 1, __)
