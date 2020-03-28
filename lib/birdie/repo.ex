defmodule Birdie.Repo do
  use Ecto.Repo,
    otp_app: :birdie,
    adapter: Ecto.Adapters.Postgres
end
