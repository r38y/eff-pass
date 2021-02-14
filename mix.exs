defmodule EFFPass.MixProject do
  use Mix.Project

  def project do
    [
      app: :eff_pass,
      version: "0.1.1",
      elixir: "~> 1.10",
      name: "EFFPass",
      description: "Generates passphrases using EFF's word lists.",
      source_url: "https://github.com/r38y/eff-pass",
      package: package(),
      deps: deps(),
      start_permanent: Mix.env() == :prod
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:csv, "~> 2.4"},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end

  defp package() do
    [
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/r38y/eff-pass"}
    ]
  end
end
