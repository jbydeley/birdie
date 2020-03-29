defmodule BirdieWeb.API.SauceControllerTest do
  use BirdieWeb.ConnCase

  alias BirdieWeb.API.SauceView

  test "#index renders a list of sauce hrefs", %{conn: conn} do
    sauce = insert(:sauce)

    conn = get conn, Routes.sauce_path(conn, :index)

    assert json_response(conn, 200) == render_json(SauceView, "index.json", %{sauces: [sauce]})
  end

  test "#show renders a single sauce", %{conn: conn} do
    sauce = insert(:sauce)

    conn = get conn, Routes.sauce_path(conn, :show, sauce)

    assert json_response(conn, 200) == render_json(SauceView, "show.json", %{sauce: sauce})
  end

  test "#create creates and renders a single sauce", %{conn: conn} do
    create_attrs = %{
      "name" => "Test Sauce",
      "spice" => 3
    }

    assert %{"links" => [%{"rel" => "self", "href" => self}|_]} = post(conn, Routes.sauce_path(conn, :create), create_attrs)
    |> json_response(201)

    sauce = get(conn, self)
    |> json_response(200)

    assert Map.get(sauce, "properties") == create_attrs
  end
end
