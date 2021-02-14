defmodule EFFPass do
  @otp_app Mix.Project.config()[:app]

  @wordlists %{
    long: "eff_large_wordlist.txt",
    short: "eff_short_wordlist_1.txt",
    short_unique: "eff_short_wordlist_2_0.txt"
  }

  def gen(options \\ []) do
    defaults = [list: :short, sep: " ", words: 4]
    options = Keyword.merge(defaults, options)

    words = load_words(options[:list])

    build_list(words, [], options[:words])
    |> Enum.join(options[:sep])
  end

  defp build_list(_, list, 0), do: list

  defp build_list(words, list, rem) do
    # don't repeat words!
    pool = words -- list
    new_list = list ++ [select_word(pool)]
    build_list(words, new_list, rem - 1)
  end

  defp select_word(words) do
    Enum.random(words)
  end

  defp load_words(list) do
    @otp_app
    |> Application.app_dir("priv/#{@wordlists[list]}")
    |> Path.expand(__DIR__)
    |> File.stream!()
    |> CSV.decode(separator: ?\t)
    |> Enum.map(fn {:ok, [_, v]} -> v end)
  end
end
