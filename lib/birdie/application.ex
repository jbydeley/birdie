defmodule Birdie.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      # Start the Ecto repository
      Birdie.Repo,
      # Start the endpoint when the application starts
      BirdieWeb.Endpoint
      # Starts a worker by calling: Birdie.Worker.start_link(arg)
      # {Birdie.Worker, arg},
    ]

    BirdieWeb.Endpoint.Instrumenter.setup()
    BirdieWeb.Plugs.MetricsExporter.setup()

    :ok =
      :telemetry.attach(
        "logger-json-ecto",
        [:birdie, :repo, :query],
        &LoggerJSON.Ecto.telemetry_logging_handler/4,
        :info
      )

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Birdie.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    BirdieWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
