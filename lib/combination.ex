defmodule Combination do
  @moduledoc """
  Provide a set of algorithms to generate combinations and permutations.

  For source collection containing non-distinct elements, pipe the resultant list through `Enum.uniq/1`
  to remove duplicate elements.
  """

  @doc """
  Generate combinations based on given collection.

  ## Examples

      iex> 1..3 |> Combination.combine(2)
      [[3, 2], [3, 1], [2, 1]]

  """
  @spec combine(Enum.t, non_neg_integer) :: [list]
  def combine(collection, k) when is_integer(k) and k >= 0 do
    list = Enum.to_list(collection)
    list_length = Enum.count(list)
    if k > list_length do
      raise Enum.OutOfBoundsError
    else
      do_combine(list, list_length, k, [], [])
    end
  end

  defp do_combine(_list, _list_length, 0, _pick_acc, _acc), do: [[]]
  defp do_combine(list, _list_length, 1, _pick_acc, _acc), do: list |> Enum.map(&([&1])) # optimization
  defp do_combine(list, list_length, k, pick_acc, acc) do
    list
    |> Stream.unfold(fn [h | t] -> {{h, t}, t} end)
    |> Enum.take(list_length)
    |> Enum.reduce(acc, fn {x, sublist}, acc ->
      sublist_length = Enum.count(sublist)
      pick_acc_length = Enum.count(pick_acc)
      if k > pick_acc_length + 1 + sublist_length do
        acc # insufficient elements in sublist to generate new valid combinations
      else
        new_pick_acc = [x | pick_acc]
        new_pick_acc_length = pick_acc_length + 1
        case new_pick_acc_length do
          ^k -> [new_pick_acc | acc]
          _  -> do_combine(sublist, sublist_length, k, new_pick_acc, acc)
        end
      end
    end)
  end

  @doc """
  Generate all permutation of the collection, filtered by `filter` function.

  The `filter` function filters the generated permutation before it is added
  to the result list. It returns true by default, thus allowing all permutations.

  ## Example

      iex> 1..3 |> Combination.permutate
      [[1, 2, 3], [2, 1, 3], [3, 1, 2], [1, 3, 2], [2, 3, 1], [3, 2, 1]]

      iex> 1..3 |> Combination.permutate(fn p -> Enum.at(p, 0) == 1 end)
      [[1, 2, 3], [1, 3, 2]]

  """
  @spec permutate(Enum.t, (list -> as_boolean(term))) :: [list]
  def permutate(collection, filter \\ fn _p -> true end) do
    collection
    |> Enum.to_list
    |> do_permutate(filter, [], [])
  end

  defp do_permutate([], filter, pick_acc, acc) do
    if filter.(pick_acc), do: [pick_acc | acc], else: acc
  end
  defp do_permutate(list, filter, pick_acc, acc) do
    list
    |> Stream.unfold(fn [h | t] -> {{h, t}, t ++ [h]} end)
    |> Enum.take(Enum.count(list))
    |> Enum.reduce(acc, fn {h, t}, acc ->
      do_permutate(t, filter, [h | pick_acc], acc)
    end)
  end
end
