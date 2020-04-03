defmodule Birdie.Orders.OrderItemTopping do
  use Birdie.Schema

  schema "order_item_toppings" do
    belongs_to :order_item, Birdie.Orders.OrderItem
    belongs_to :topping, Birdie.Ingredients.Topping

    timestamps()
  end

  def changeset(%__MODULE__{} = order_item_topping, attrs \\ %{}) do
    order_item_topping
    |> cast(attrs, [:order_item_id, :topping_id])
    |> validate_required([:order_item_id, :topping_id])
  end
end
