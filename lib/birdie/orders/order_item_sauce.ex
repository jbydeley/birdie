defmodule Birdie.Orders.OrderItemSauce do
  use Birdie.Schema

  schema "order_item_sauces" do
    belongs_to :order_item, Birdie.Orders.OrderItem
    belongs_to :sauce, Birdie.Ingredients.Sauce

    timestamps()
  end

  def changeset(%__MODULE__{} = order_item_sauce, attrs \\ %{}) do
    order_item_sauce
    |> cast(attrs, [:order_item_id, :sauce_id])
    |> validate_required([:order_item_id, :sauce_id])
  end
end
