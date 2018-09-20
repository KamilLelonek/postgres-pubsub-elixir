use Mix.Config

config :postgres_pubub,
  ecto_repos: [PostgresPubSub.Repo]

config :postgres_pubub, PostgresPubSub.Repo,
  adapter: Ecto.Adapters.Postgres,
  hostname: "localhost",
  username: "postgres",
  password: "postgres",
  migration_timestamps: [type: :utc_datetime],
  migration_primary_key: [id: :uuid, type: :binary_id]

import_config "#{Mix.env()}.exs"
