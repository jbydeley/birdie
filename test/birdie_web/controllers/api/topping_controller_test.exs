defmodule BirdieWeb.API.ToppingControllerTest do
  use BirdieWeb.ConnCase

  alias Birdie.Ingredients
  alias BirdieWeb.API.ToppingView

  test "#index renders a list of topping hrefs", %{conn: conn} do
    topping = insert(:topping)

    conn = get conn, Routes.topping_path(conn, :index)

    assert json_response(conn, 200) == render_json(ToppingView, "index.json", %{toppings: [topping]})
  end

  test "#show renders a single topping", %{conn: conn} do
    topping = insert(:topping)

    conn = get conn, Routes.topping_path(conn, :show, topping)

    assert json_response(conn, 200) == render_json(ToppingView, "show.json", %{topping: topping})
  end

  test "#create creates and renders a single topping", %{conn: conn} do
    create_attrs = %{
      "name" => "Test Topping",
      "description" => "Test Description",
      "spice" => 4,
      "cost" => 2
    }

    assert %{"links" => [%{"rel" => "self", "href" => self}|_]} = post(conn, Routes.topping_path(conn, :create), create_attrs)
    |> json_response(201)

    topping = get(conn, self)
    |> json_response(200)

    assert Map.get(topping, "properties") == create_attrs
  end
end
