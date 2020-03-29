defmodule Birdie.Entrees do
  import Ecto.Query

  alias Birdie.Repo
  alias Birdie.Entrees.Entree

  def create_Entree(attrs \\ %{}) do
    %Entree{}
    |> Entree.changeset(attrs)
    |> Repo.insert()
  end

  def update_Entree(id, attrs \\ %{}) do
    Repo.get!(Entree, id)
    |> Entree.changeset(attrs)
    |> Repo.update()
  end

  def list_Entrees() do
    query = from t in Entree,
      select: t.id
    Repo.all(query)
  end

  def find_Entree(id) do
    Repo.get(Entree, id)
  end

  def delete_Entree(id) do
    query = from t in Entree,
      where: t.id == ^id

    Repo.delete_all(query)
  end
end
