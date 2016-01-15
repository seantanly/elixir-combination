Combination
========
[![Build Status](https://travis-ci.org/seantanly/elixir-combination.svg?branch=master)](https://travis-ci.org/seantanly/elixir-combination)
[![Hex.pm Version](http://img.shields.io/hexpm/v/combination.svg?style=flat)](https://hex.pm/packages/combination)

Elixir library to generate combinations and permutations from `Enumerable`.

See [Examples](#examples).


## Documentation

API documentation is available at [http://hexdocs.pm/combination](http://hexdocs.pm/combination)

## Adding Combination To Your Project

To use Combination with your projects, edit your `mix.exs` file and add it as a dependency:

```elixir
defp deps do
  [
    {:combination, "~> x.x.x"},
  ]
end
```

## Examples

To generate combinations,

```elixir

iex> 1..3 |> Combination.combine(2)
[[3, 2], [3, 1], [2, 1]]

```

To generate permutations,

```elixir

iex> 1..3 |> Combination.permutate
[[1, 2, 3], [2, 1, 3], [3, 1, 2], [1, 3, 2], [2, 3, 1], [3, 2, 1]]

iex> 1..3 |> Combination.permutate(fn p -> Enum.at(p, 0) == 1 end)
[[1, 2, 3], [1, 3, 2]]

```

## LICENSE

This software is licensed under [MIT License](LICENSE.md).
