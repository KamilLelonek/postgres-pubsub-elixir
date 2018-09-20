use Mix.Config

config :postgres_pubub, PostgresPubSub.Repo,
  database: "postgres_pubub_test",
  pool: Ecto.Adapters.SQL.Sandbox
