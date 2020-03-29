defmodule BirdieWeb.API.SauceViewTest do
  use BirdieWeb.ConnCase, async: true
  import BirdieWeb.Factory

  alias BirdieWeb.API.SauceView

  test "index.json" do
    sauce = insert(:sauce)

    rendered_sauce = SauceView.render("index.json", %{sauces: [sauce]})

    assert rendered_sauce == %{
      "actions" => [%{
        "name" => "Create Sauce",
        "method" => "POST",
        "href" => Routes.sauce_url(@endpoint, :create),
        "type" => "application/json",
        "fields" => [%{
          "name" => "name",
          "type" => "text",
          "required" => true,
        }, %{
          "name" => "spice",
          "type" => "text"
        }]
      }],
      "class" => "sauces",
      "entities" => [SauceView.render("sauce-link.json", %{sauce: sauce})]
    }
  end

  test "sauce-link.json" do
    sauce = insert(:sauce)

    rendered_sauce = SauceView.render("sauce-link.json", %{sauce: sauce})

    assert rendered_sauce == %{
      "class" => "sauce",
      "href" => Routes.sauce_url(@endpoint, :show, sauce)
    }
  end

  test "show.json" do
    sauce = insert(:sauce)

    rendered_sauce = SauceView.render("show.json", %{sauce: sauce}) |> format_json

    assert rendered_sauce == %{
      "actions" => [%{
        "name" => "Delete Sauce",
        "method" => "DELETE",
        "href" => Routes.sauce_url(@endpoint, :delete, sauce)
      }, %{
        "name" => "Update sauce",
        "method" => "PUT",
        "href" => Routes.sauce_url(@endpoint, :update, sauce),
        "type" => "application/json",
        "fields" => [%{
          "name" => "name",
          "type" => "text"
        }, %{
          "name" => "spice",
          "type" => "text"
        }]
      }],
      "class" => "sauce",
      "properties" => %{
        "name" => sauce.name,
        "spice" => sauce.spice
      },
      "links" => [%{
        "class" => "sauce",
        "rel" => "self",
        "href" => Routes.sauce_url(@endpoint, :show, sauce)
      }, %{
        "class" => "sauces",
        "rel" => "parent",
        "href" => Routes.sauce_url(@endpoint, :index)
      }]
    }
  end
end
