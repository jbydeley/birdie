defmodule BirdieWeb.API.SauceController do
  use BirdieWeb, :controller

  alias Birdie.Ingredients

  require Logger

  def index(conn, _params) do
    sauces = Ingredients.list_sauces()

    conn = Enum.reduce(sauces, conn, fn (sauce, acc) ->
      push(acc, Routes.sauce_path(conn, :show, sauce))
    end)

    conn
    |> render("index.json", sauces: sauces)
  end

  def show(conn, %{"id" => id}) do
    sauce = Ingredients.find_sauce(id)

    conn
    |> render("show.json", sauce: sauce)
  end

  def create(conn, %{"name" => _} = params) do
    case Ingredients.create_sauce(params) do
      {:ok, sauce} ->
        conn
        |> put_status(:created)
        |> render("show.json", sauce: sauce)
      _ ->
        text(conn, "Failed")
    end
  end

  def update(conn, %{"id" => id} = params) do
    case Ingredients.update_sauce(id, params) do
      {:ok, sauce} ->
        conn
        |> put_status(:accepted)
        |> render("show.json", sauce: sauce)
      _ ->
        text(conn, "Failed")
    end
  end
  def delete(conn, %{"id" => id}) do
    case Ingredients.delete_sauce(id) do
      {:ok, sauce} ->
        Logger.info("sauce '#{sauce.name}' (#{sauce.id}) was deleted")
      _ ->
        Logger.error("Failed to delete '#{id}'")
    end

    conn
    |> put_status(:no_content)
    |> text("Delete successful")
  end
end
