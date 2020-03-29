defmodule BirdieWeb.API.ToppingViewTest do
  use BirdieWeb.ConnCase, async: true
  import BirdieWeb.Factory

  alias BirdieWeb.API.ToppingView

  test "index.json" do
    topping = insert(:topping)

    rendered_topping = ToppingView.render("index.json", %{toppings: [topping]})

    assert rendered_topping == %{
      "actions" => [%{
        "name" => "Create Topping",
        "method" => "POST",
        "href" => Routes.topping_url(@endpoint, :create),
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
      "entities" => [ToppingView.render("topping-link.json", %{topping: topping})]
    }
  end

  test "topping-link.json" do
    topping = insert(:topping)

    rendered_topping = ToppingView.render("topping-link.json", %{topping: topping})

    assert rendered_topping == %{
      "class" => "topping",
      "href" => Routes.topping_url(@endpoint, :show, topping)
    }
  end

  test "show.json" do
    topping = insert(:topping)

    rendered_topping = ToppingView.render("show.json", %{topping: topping}) |> format_json

    assert rendered_topping == %{
      "actions" => [%{
        "name" => "Delete Topping",
        "method" => "DELETE",
        "href" => Routes.topping_url(@endpoint, :delete, topping)
      }, %{
        "name" => "Update Topping",
        "method" => "PUT",
        "href" => Routes.topping_url(@endpoint, :update, topping),
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
      "properties" => %{
        "name" => topping.name,
        "description" => topping.description,
        "spice" => topping.spice,
        "cost" => topping.cost
      },
      "links" => [%{
        "class" => "topping",
        "rel" => "self",
        "href" => Routes.topping_url(@endpoint, :show, topping)
      }, %{
        "class" => "toppings",
        "rel" => "parent",
        "href" => Routes.topping_url(@endpoint, :index)
      }]
    }
  end
end
