defmodule BirdieWeb.API.ToppingView do
  use BirdieWeb, :view


  def render("index.json", %{toppings: toppings}) do
    %{
      "class" => ["topping", "collection"],
      "entities" => render_many(toppings, __MODULE__, "topping-link.json")
    }
  end

  def render("topping-link.json", %{topping: topping}) do
    %{
      "class" => ["topping"],
      "href" => Routes.topping_url(BirdieWeb.Endpoint, :show, topping)
    }
  end

  def render("show.json", %{topping: topping}) do
    %{
      "properties" => %{
        "name" => topping.name,
        "description" => topping.description,
        "spice" => topping.spice,
        "cost" => topping.cost
      },
      "links" => %{
        "self" => Routes.topping_url(BirdieWeb.Endpoint, :show, topping),
        "parent" => Routes.topping_url(BirdieWeb.Endpoint, :index)
      }
    }
  end
end
