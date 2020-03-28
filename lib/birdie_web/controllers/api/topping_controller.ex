defmodule BirdieWeb.API.ToppingController do
  use BirdieWeb, :controller

  alias Birdie.Ingredients

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
        redirect(conn, to: Routes.topping_path(conn, :show, topping))
      _ ->
        text(conn, "Failed")
    end
  end
end
