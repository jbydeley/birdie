defmodule BirdieWeb.API.ProteinControllerTest do
  use BirdieWeb.ConnCase

  alias BirdieWeb.API.ProteinView

  test "#index renders a list of protein hrefs", %{conn: conn} do
    protein = insert(:protein)

    conn = get conn, Routes.protein_path(conn, :index)

    assert json_response(conn, 200) == render_json(ProteinView, "index.json", %{proteins: [protein]})
  end

  test "#show renders a single Protein", %{conn: conn} do
    protein = insert(:protein)

    conn = get conn, Routes.protein_path(conn, :show, protein)

    assert json_response(conn, 200) == render_json(ProteinView, "show.json", %{protein: protein})
  end

  test "#create creates and renders a single Protein", %{conn: conn} do
    create_attrs = %{
      "name" => "Test Protein"
    }

    assert %{"links" => [%{"rel" => "self", "href" => self}|_]} = post(conn, Routes.protein_path(conn, :create), create_attrs)
    |> json_response(201)

    protein = get(conn, self)
    |> json_response(200)

    assert Map.get(protein, "properties") == create_attrs
  end
end
