defmodule Birdie.Proteins.Protein do
  use Birdie.Schema

  @derive {Jason.Encoder, only: [:name]}
  schema "proteins" do
    field :name, :string

    timestamps()
  end

  def changeset(%__MODULE__{} = protein, attrs \\ %{}) do
    protein
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
