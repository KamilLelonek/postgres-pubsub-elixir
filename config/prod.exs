use Mix.Config

config :postgres_pubub, PostgresPubSub.Repo,
  url: System.get_env("DATABASE_URL"),
  pool_size: String.to_integer(System.get_env("POOL_SIZE")),
  ssl: true
