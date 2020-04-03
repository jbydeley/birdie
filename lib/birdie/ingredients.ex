defmodule Birdie.Ingredients do
  import Ecto.Query

  alias Birdie.Repo
  alias Birdie.Orders.OrderItem
  alias Birdie.Ingredients.{Sauce, Topping}

  def create_topping(attrs \\ %{}) do
    %Topping{}
    |> Topping.changeset(attrs)
    |> Repo.insert()
  end

  def update_topping(id, attrs \\ %{}) do
    Repo.get!(Topping, id)
    |> Topping.changeset(attrs)
    |> Repo.update()
  end

  def list_toppings_by_order_item(order_item_id, offset \\ 0, limit \\ 15) do
    # Sub Query to join order_item and topping through order_item_topping
    query = from t in Topping,
      join: o in OrderItem,
      on: o.topping_id == ^order_item_id,
      offset: ^offset,
      limit: ^limit

    Repo.all(query)
  end

  def list_toppings(offset \\ 0, limit \\ 15) do
    count = Repo.all(from t in Topping, select: count(t))

    query = from t in Topping,
      offset: ^offset,
      limit: ^limit,
      select: t.id

    toppings = Repo.all(query)
    {toppings, count}
  end

  def find_topping(id) do
    Repo.get(Topping, id)
  end

  def delete_topping(id) do
    query = from t in Topping,
      where: t.id == ^id

    Repo.delete_all(query)
  end

  def create_sauce(attrs \\ %{}) do
    %Sauce{}
    |> Sauce.changeset(attrs)
    |> Repo.insert()
  end

  def update_sauce(id, attrs \\ %{}) do
    Repo.get!(Sauce, id)
    |> Sauce.changeset(attrs)
    |> Repo.update()
  end

  def list_sauces() do
    query = from t in Sauce,
      select: t.id
    Repo.all(query)
  end

  def find_sauce(id) do
    Repo.get(Sauce, id)
  end

  def delete_sauce(id) do
    query = from t in Sauce,
      where: t.id == ^id

    Repo.delete_all(query)
  end
end
