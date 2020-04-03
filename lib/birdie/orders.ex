defmodule Birdie.Orders do
  import Ecto.Query

  alias Birdie.Repo
  alias Birdie.Orders.{Order, OrderItem}

  def create_order(attrs \\ %{}) do
    %Order{}
    |> Order.create_changeset(attrs)
    |> Repo.insert()
  end

  def update_order(id, attrs \\ %{}) do
    Repo.get!(Order, id)
    |> Order.create_changeset(attrs)
    |> Repo.update()
  end

  def list_orders(offset \\ 0, limit \\ 15) do
    query = from t in Order,
      offset: ^offset,
      limit: ^limit,
      select: t.id

    Repo.all(query)
  end

  def find_order(id) do
    Repo.get(Order, id)
  end

  def delete_order(id) do
    query = from t in Order,
      where: t.id == ^id

    Repo.delete_all(query)
  end

  ###
  # OrderItem
  ###

  def create_order_item(attrs \\ %{}) do
    %OrderItem{}
    |> OrderItem.changeset(attrs)
    |> Repo.insert()
  end

  def update_order_item(id, attrs \\ %{}) do
    Repo.get!(OrderItem, id)
    |> OrderItem.changeset(attrs)
    |> Repo.update()
  end

  def list_order_items(order_id, offset \\ 0, limit \\ 15) do
    query = from t in OrderItem,
      where: t.order_id == ^order_id,
      offset: ^offset,
      limit: ^limit

    Repo.all(query)
  end

  def find_order_item(id) do
    Repo.get(OrderItem, id)
  end

  def delete_order_item(id) do
    query = from t in OrderItem,
      where: t.id == ^id

    Repo.delete_all(query)
  end

end
