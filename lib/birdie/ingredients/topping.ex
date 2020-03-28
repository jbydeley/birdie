defmodule Birdie.Ingredients.Topping do
  use Birdie.Schema

  @derive {Jason.Encoder, only: [:id, :name, :description, :spice, :cost]}
  schema "toppings" do
    field :name, :string
    field :description, :string
    field :spice, :integer
    field :cost, :integer

    timestamps()
  end

  def create_changeset(%__MODULE__{} = topping, attrs \\ %{}) do
    topping
    |> cast(attrs, [:name, :description, :spice, :cost])
    |> validate_required([:name])
  end
end
