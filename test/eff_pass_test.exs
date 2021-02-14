defmodule EFFPassTest do
  use ExUnit.Case
  doctest EFFPass

  describe "gen()" do
    test "generates a 4 word phrase" do
      sep = " "
      phrase = EFFPass.gen()
      size = phrase |> String.split(sep) |> length()
      assert size == 4
    end

    test "has four unique words" do
      sep = " "
      phrase = EFFPass.gen()
      size = phrase |> String.split(sep) |> Enum.uniq() |> length()
      assert size == 4
    end

    test "can use a different separator" do
      sep = "-"
      phrase = EFFPass.gen(sep: sep)
      size = phrase |> String.split(sep) |> Enum.uniq() |> length()
      assert size == 4
    end

    test "can output different numbers of words" do
      sep = " "
      words = 10
      phrase = EFFPass.gen(sep: sep, words: words)
      size = phrase |> String.split(sep) |> Enum.uniq() |> length()
      assert size == words
    end
  end
end
