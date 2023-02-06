defmodule PrizeStrings do
  @moduledoc """
  Provide solution of the Euler Problem 191

  Algorithm explanation:
    Using six types of variables, it is possible to describe the changes
    that occur when the n days increases, based on primary data

      a = strings ending in AA
      b = with zero Ls
      с = ending in A (and only A)
      d = ending in AA that also have exactly one L
      e = ending in A that also have exactly one L
      f = with one L that don’t end in A

    Formula of the data mutations:

      n -> n + 1
      t -> 2 * t + b - a
      a -> c
      b -> 2 * b - a + d
      c -> t - (a + c)
      d -> e
      e -> f
      f -> t
  """

  @types_value %{n: 1, t: 3, a: 0, b: 2, c: 1, d: 0, e: 0, f: 1}

  def solve(days = 1) do
    {:ok, "Prize Strings over a #{days}-day period is #{inspect(@types_value.t)}"}
  end

  def solve(days \\ 30) when is_integer(days) do
    result = Enum.reduce(1..days-1, @types_value, fn _x, acc ->
      transform(acc)
    end)

    {:ok, "Prize Strings over a #{days}-day period is #{inspect(result.t)}"}
  end

  def solve(_days) do
    {:error, "Invalid parameters for the problem"}
  end

  def transform(map) do
    %{map | n: map.n + 1, t: 2 * map.t + map.b - map.a, a: map.c, b: 2 * map.b - map.a + map.d, c: map.t - (map.a + map.c), d: map.e, e: map.f, f: map.t}
  end
end
