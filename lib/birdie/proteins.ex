defmodule Birdie.Proteins do
  import Ecto.Query

  alias Birdie.Repo
  alias Birdie.Proteins.Protein

  def create_protein(attrs \\ %{}) do
    %Protein{}
    |> Protein.changeset(attrs)
    |> Repo.insert()
  end

  def update_protein(id, attrs \\ %{}) do
    Repo.get!(Protein, id)
    |> Protein.changeset(attrs)
    |> Repo.update()
  end

  def list_proteins() do
    query = from t in Protein,
      select: t.id
    Repo.all(query)
  end

  def find_protein(id) do
    Repo.get(Protein, id)
  end

  def delete_protein(id) do
    query = from t in Protein,
      where: t.id == ^id

    Repo.delete_all(query)
  end
end
