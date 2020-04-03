defmodule Birdie.Orders.OrderItem do
  use Birdie.Schema

  @derive {Jason.Encoder, only: [:order_id, :entree_id, :protein_id]}
  schema "order_items" do
    belongs_to :order, Birdie.Orders.Order
    belongs_to :entree, Birdie.Entrees.Entree
    belongs_to :protein, Birdie.Proteins.Protein

    many_to_many :toppings, Birdie.Ingredients.Topping, join_through: "order_item_toppings"
    many_to_many :sauces, Birdie.Ingredients.Sauce, join_through: "order_item_sauces"

    timestamps()
  end

  def changeset(%__MODULE__{} = order_item, attrs \\ %{}) do
    order_item
    |> cast(attrs, [:order_id, :entree_id, :protein_id])
    |> validate_required([:order_id, :entree_id, :protein_id])
  end
end
