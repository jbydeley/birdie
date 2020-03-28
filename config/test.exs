use Mix.Config

# Configure your database
config :birdie, Birdie.Repo,
  username: "postgres",
  password: "postgres",
  database: "birdie_test",
  hostname: "localhost",
  migration_primary_key: [name: :id, type: :binary_id],
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :birdie, BirdieWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
