defmodule Birdie.Ingredients.Sauce do
  use Birdie.Schema

  @derive {Jason.Encoder, only: [:name, :spice]}
  schema "sauces" do
    field :name, :string
    field :spice, :integer

    timestamps()
  end

  def changeset(%__MODULE__{} = sauce, attrs \\ %{}) do
    sauce
    |> cast(attrs, [:name, :spice])
    |> validate_required([:name])
  end
end
