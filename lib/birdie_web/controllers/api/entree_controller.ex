defmodule BirdieWeb.API.EntreeController do
  use BirdieWeb, :controller

  alias Birdie.Entrees

  require Logger

  def index(conn, _params) do
    entrees = Entrees.list_Entrees()

    # conn = Enum.reduce(entrees, conn, fn (entree, acc) ->
    #   push(acc, Routes.entree_path(conn, :show, entree))
    # end)

    conn
    |> render("index.json", entrees: entrees)
  end

  def show(conn, %{"id" => id}) do
    entree = Entrees.find_Entree(id)

    conn
    |> render("show.json", entree: entree)
  end

  def create(conn, %{"name" => _} = params) do
    case Entrees.create_Entree(params) do
      {:ok, entree} ->
        conn
        |> put_status(:created)
        |> render("show.json", entree: entree)
      _ ->
        text(conn, "Failed")
    end
  end

  def update(conn, %{"id" => id} = params) do
    case Entrees.update_Entree(id, params) do
      {:ok, entree} ->
        conn
        |> put_status(:accepted)
        |> render("show.json", entree: entree)
      _ ->
        text(conn, "Failed")
    end
  end
  def delete(conn, %{"id" => id}) do
    case Entrees.delete_Entree(id) do
      {:ok, entree} ->
        Logger.info("Entree '#{entree.name}' (#{entree.id}) was deleted")
      _ ->
        Logger.error("Failed to delete '#{id}'")
    end

    conn
    |> put_status(:no_content)
    |> text("Delete successful")
  end
end
