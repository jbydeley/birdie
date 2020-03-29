defmodule BirdieWeb.API.EntreeControllerTest do
  use BirdieWeb.ConnCase

  alias BirdieWeb.API.EntreeView

  test "#index renders a list of entree hrefs", %{conn: conn} do
    entree = insert(:entree)

    conn = get conn, Routes.entree_path(conn, :index)

    assert json_response(conn, 200) == render_json(EntreeView, "index.json", %{entrees: [entree]})
  end

  test "#show renders a single entree", %{conn: conn} do
    entree = insert(:entree)

    conn = get conn, Routes.entree_path(conn, :show, entree)

    assert json_response(conn, 200) == render_json(EntreeView, "show.json", %{entree: entree})
  end

  test "#create creates and renders a single entree", %{conn: conn} do
    create_attrs = %{
      "name" => "Test Entree"
    }

    assert %{"links" => [%{"rel" => "self", "href" => self}|_]} = post(conn, Routes.entree_path(conn, :create), create_attrs)
    |> json_response(201)

    entree = get(conn, self)
    |> json_response(200)

    assert Map.get(entree, "properties") == create_attrs
  end
end
