defmodule BirdieWeb.API.ToppingView do
  use BirdieWeb, :view


  def render("index.json", %{toppings: toppings}) do
    %{
      "actions" => [%{
        "name" => "Create Topping",
        "method" => "POST",
        "href" => Routes.topping_url(BirdieWeb.Endpoint, :create),
        "type" => "application/json",
        "fields" => [%{
          "name" => "name",
          "type" => "text",
          "required" => true,
        }, %{
          "name" => "description",
          "type" => "text"
        }, %{
          "name" => "spice",
          "type" => "number",
          "default" => 0
        }, %{
          "name" => "cost",
          "type" => "number",
          "default" => 0
        }]
      }],
      "class" => "toppings",
      "entities" => render_many(toppings, __MODULE__, "topping-link.json")
    }
  end

  def render("topping-link.json", %{topping: topping}) do
    %{
      "class" => "topping",
      "href" => Routes.topping_url(BirdieWeb.Endpoint, :show, topping)
    }
  end

  def render("show.json", %{topping: topping}) do
    %{
      "actions" => [%{
        "name" => "Delete Topping",
        "method" => "DELETE",
        "href" => Routes.topping_url(BirdieWeb.Endpoint, :delete, topping)
      }, %{
        "name" => "Update Topping",
        "method" => "PUT",
        "href" => Routes.topping_url(BirdieWeb.Endpoint, :update, topping),
        "type" => "application/json",
        "fields" => [%{
          "name" => "name",
          "type" => "text"
        }, %{
          "name" => "description",
          "type" => "text"
        }, %{
          "name" => "spice",
          "type" => "number",
          "default" => 0
        }, %{
          "name" => "cost",
          "type" => "number",
          "default" => 0
        }]
      }],
      "class" => "topping",
      "properties" => topping,
      "links" => [%{
        "class" => "topping",
        "rel" => "self",
        "href" => Routes.topping_url(BirdieWeb.Endpoint, :show, topping)
      }, %{
        "class" => "toppings",
        "rel" => "parent",
        "href" => Routes.topping_url(BirdieWeb.Endpoint, :index)
      }]
    }
  end
end
