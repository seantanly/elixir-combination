defmodule Combination.Mixfile do
  use Mix.Project

  @version "0.0.3"

  def project do
    [
      app: :combination,
      version: @version,
      elixir: "~> 1.2",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      name: "Combination",
      source_url: "https://github.com/seantanly/elixir-combination",
      homepage_url: "https://github.com/seantanly/elixir-combination",
      description: """
      Elixir library computing simple combination and permutation on Enumerables.
      """,
      docs: docs()
    ]
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
    [
      {:credo, ">= 0.0.0", only: [:dev, :test]},
      {:dialyxir, "~> 0.5", only: [:dev], runtime: false},
      {:ex_doc, ">= 0.0.0", only: [:dev], runtime: false}
    ]
  end

  defp package do
    [
      maintainers: ["Sean Tan Li Yang"],
      licenses: ["MIT"],
      links: %{github: "https://github.com/seantanly/elixir-combination"},
      files: ~w(lib test) ++ ~w(mix.exs CHANGELOG.md LICENSE.md README.md)
    ]
  end

  defp docs do
    [
      source_ref: "v#{@version}",
      main: "Combination",
      # logo: "path/to/logo.png",
      extras: ~w(CHANGELOG.md LICENSE.md README.md)
    ]
  end
end
