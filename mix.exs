defmodule Combination.Mixfile do
  use Mix.Project

  @version "0.0.1"

  def project do
    [
      app: :combination,
      version: @version,
      elixir: "~> 1.2",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps,
      package: package,
      name: "Combination",
      source_url: "https://github.com/seantanly/elixir-minmaxlist",
      homepage_url: "https://github.com/seantanly/elixir-minmaxlist",
      description: """
      Elixir library computing simple combination and permuation on Enumerables.
      """,
      docs: docs,
    ]
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
    [
      {:credo, ">= 0.0.0", only: [:dev, :test]},
      {:earmark, "== 0.1.19", only: :docs},
      {:ex_doc, ">= 0.10.0", only: :docs},
    ]
  end

  defp package do
    [
      maintainers: ["Sean Tan Li Yang"],
      licenses: ["MIT"],
      links: %{github: "https://github.com/seantanly/elixir-combination"},
      files: ~w(lib test) ++
             ~w(CHANGELOG.md LICENSE mix.exs README.md),
    ]
  end

  defp docs do
    [
      source_ref: "v#{@version}", 
      main: "Combination",
      # logo: "path/to/logo.png",
      extras: ~w(CHANGELOG.md README.md LICENSE.md)
    ]
  end
end
