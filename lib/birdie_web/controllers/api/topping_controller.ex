defmodule BirdieWeb.API.ToppingController do
  use BirdieWeb, :controller

  alias Birdie.Ingredients

  require Logger

  def index(conn, _params) do
    toppings = Ingredients.list_toppings()

    render(conn, "index.json", toppings: toppings)
  end

  def show(conn, %{"id" => id}) do
    topping = Ingredients.find_topping(id)

    render(conn, "show.json", topping: topping)
  end

  def create(conn, %{"name" => _} = params) do
    case Ingredients.create_topping(params) do
      {:ok, topping} ->
        conn
        |> put_status(:created)
        |> render("show.json", topping: topping)
      _ ->
        text(conn, "Failed")
    end
  end

  def update(conn, %{"id" => id} = params) do
    case Ingredients.update_topping(id, params) do
      {:ok, topping} ->
        conn
        |> put_status(:accepted)
        |> render("show.json", topping: topping)
      _ ->
        text(conn, "Failed")
    end
  end
  def delete(conn, %{"id" => id}) do
    case Ingredients.delete_topping(id) do
      {:ok, topping} ->
        Logger.info("Topping '#{topping.name}' (#{topping.id}) was deleted")
      _ ->
        Logger.error("Failed to delete '#{id}'")
    end

    conn
    |> put_status(:no_content)
    |> text("Delete successful")
  end
end
