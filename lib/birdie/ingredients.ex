defmodule Birdie.Ingredients do
  import Ecto.Query

  alias Birdie.Repo
  alias Birdie.Ingredients.Topping

  def create_topping(attrs \\ %{}) do
    %Topping{}
    |> Topping.create_changeset(attrs)
    |> Repo.insert()
  end

  def list_toppings() do
    query = from t in Topping,
      select: t.id
    Repo.all(query)
  end

  def find_topping(id) do
    Repo.get(Topping, id)
  end
end
