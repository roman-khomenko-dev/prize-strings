defmodule PrizeStringsTest do
  use ExUnit.Case
  doctest PrizeStrings

  setup do
    {:ok, solve_result: {:ok, "Prize Strings over a 30-day period is 1918080160"}}
  end

  test "Solve function should return correct answer", %{solve_result: solve_result} do
    assert PrizeStrings.solve(30) == solve_result
  end

  test "When function called with invalid parameters it should return an {:error, message} tuple" do
    assert {:error, "Invalid parameters for the problem"} == PrizeStrings.solve("thirty")
  end
end
