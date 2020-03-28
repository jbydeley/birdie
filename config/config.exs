# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :birdie,
  ecto_repos: [Birdie.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :birdie, BirdieWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "0yI8Ixyor/UqPdFpiJyY8VJzgVBcd3hpYdPfOxuTImunW5JHonNTbQLVM1hDecoY",
  render_errors: [view: BirdieWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Birdie.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "+UTEXNkW"]

# Configures Elixir's Logger
config :logger, backends: [LoggerJSON]
config :birdie, Birdie.Repo, loggers: [{LoggerJSON.Ecto, :log, [:info]}]

config :logger_json, :backend,
  metadata: [:file, :line, :function, :module, :application, :httpRequest, :query],
  formatter: Birdie.LoggerFormatter

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason
config :phoenix, :logger, false

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
