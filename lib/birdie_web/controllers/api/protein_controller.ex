defmodule BirdieWeb.API.ProteinController do
  use BirdieWeb, :controller

  alias Birdie.Proteins

  require Logger

  def index(conn, _params) do
    proteins = Proteins.list_proteins()

    # conn = Enum.reduce(proteins, conn, fn (protein, acc) ->
    #   push(acc, Routes.protein_path(conn, :show, protein))
    # end)

    conn
    |> render("index.json", proteins: proteins)
  end

  def show(conn, %{"id" => id}) do
    protein = Proteins.find_protein(id)

    conn
    |> render("show.json", protein: protein)
  end

  def create(conn, %{"name" => _} = params) do
    case Proteins.create_protein(params) do
      {:ok, protein} ->
        conn
        |> put_status(:created)
        |> render("show.json", protein: protein)
      _ ->
        text(conn, "Failed")
    end
  end

  def update(conn, %{"id" => id} = params) do
    case Proteins.update_protein(id, params) do
      {:ok, protein} ->
        conn
        |> put_status(:accepted)
        |> render("show.json", protein: protein)
      _ ->
        text(conn, "Failed")
    end
  end
  def delete(conn, %{"id" => id}) do
    case Proteins.delete_protein(id) do
      {:ok, protein} ->
        Logger.info("protein '#{protein.name}' (#{protein.id}) was deleted")
      _ ->
        Logger.error("Failed to delete '#{id}'")
    end

    conn
    |> put_status(:no_content)
    |> text("Delete successful")
  end
end
