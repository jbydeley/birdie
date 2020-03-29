defmodule Birdie.Entrees.Entree do
  use Birdie.Schema

  @derive {Jason.Encoder, only: [:name]}
  schema "entrees" do
    field :name, :string

    timestamps()
  end

  def changeset(%__MODULE__{} = entree, attrs \\ %{}) do
    entree
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
