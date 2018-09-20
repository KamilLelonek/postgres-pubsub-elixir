defmodule PostgresPubSub.MixProject do
  use Mix.Project

  def project do
    [
      app: :postgres_pubub,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {PostgresPubSub.Application, []}
    ]
  end

  defp deps do
    [
      {:postgrex, "~> 0.13.5"},
      {:ecto, "~> 2.2"},
      {:poison, "~> 3.0"},
      {:credo, "~> 0.10", except: :prod, runtime: false}
    ]
  end

  defp aliases do
    [
      "ecto.setup": ["ecto.create", "ecto.migrate"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      test: ["ecto.reset", "test"]
    ]
  end
end
