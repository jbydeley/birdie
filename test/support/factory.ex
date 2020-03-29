defmodule BirdieWeb.Factory do
  use ExMachina.Ecto, repo: Birdie.Repo

  alias Birdie.Entrees.Entree
  alias Birdie.Proteins.Protein
  alias Birdie.Ingredients.{Sauce,Topping}

  def topping_factory do
    %Topping{
      name: "Refried Tests",
      description: "What a delicious test.",
      spice: 5,
      cost: 0
    }
  end

  def protein_factory do
    %Protein{
      name: "Chorizo Test"
    }
  end

  def entree_factory do
    %Entree{
      name: "Taco Test"
    }
  end

  def sauce_factory do
    %Sauce{
      name: "Spict Test Sauce",
      spice: 5
    }
  end
end
