defmodule BirdieWeb.PageController do
  use BirdieWeb, :controller

  require Logger

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
