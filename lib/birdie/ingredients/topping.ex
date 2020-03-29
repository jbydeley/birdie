defmodule Birdie.Ingredients.Topping do
  use Birdie.Schema

  @derive {Jason.Encoder, only: [:name, :description, :spice, :cost]}
  schema "toppings" do
    field :name, :string
    field :description, :string
    field :photo_url, :string
    field :spice, :integer
    field :cost, :integer

    timestamps()
  end

  def changeset(%__MODULE__{} = topping, attrs \\ %{}) do
    topping
    |> cast(attrs, [:name, :description, :photo_url, :spice, :cost])
    |> validate_required([:name])
  end
end
