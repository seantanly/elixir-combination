defmodule CombinationTest do
  use ExUnit.Case
  doctest Combination

  test ".combine" do
    assert_raise Enum.OutOfBoundsError, fn ->
      1..2 |> Combination.combine(3)
    end
  end

  test ".permutate" do
    assert Combination.permutate([]) == [[]]
  end
end
