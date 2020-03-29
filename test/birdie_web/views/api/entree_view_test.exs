defmodule BirdieWeb.API.EntreeViewTest do
  use BirdieWeb.ConnCase, async: true
  import BirdieWeb.Factory

  alias BirdieWeb.API.EntreeView

  test "index.json" do
    entree = insert(:entree)

    rendered_entree = EntreeView.render("index.json", %{entrees: [entree]})

    assert rendered_entree == %{
      "actions" => [%{
        "name" => "Create Entree",
        "method" => "POST",
        "href" => Routes.entree_url(@endpoint, :create),
        "type" => "application/json",
        "fields" => [%{
          "name" => "name",
          "type" => "text",
          "required" => true,
        }]
      }],
      "class" => "entrees",
      "entities" => [EntreeView.render("entree-link.json", %{entree: entree})]
    }
  end

  test "entree-link.json" do
    entree = insert(:entree)

    rendered_entree = EntreeView.render("entree-link.json", %{entree: entree})

    assert rendered_entree == %{
      "class" => "entree",
      "href" => Routes.entree_url(@endpoint, :show, entree)
    }
  end

  test "show.json" do
    entree = insert(:entree)

    rendered_entree = EntreeView.render("show.json", %{entree: entree}) |> format_json

    assert rendered_entree == %{
      "actions" => [%{
        "name" => "Delete Entree",
        "method" => "DELETE",
        "href" => Routes.entree_url(@endpoint, :delete, entree)
      }, %{
        "name" => "Update entree",
        "method" => "PUT",
        "href" => Routes.entree_url(@endpoint, :update, entree),
        "type" => "application/json",
        "fields" => [%{
          "name" => "name",
          "type" => "text"
        }]
      }],
      "class" => "entree",
      "properties" => %{
        "name" => entree.name
      },
      "links" => [%{
        "class" => "entree",
        "rel" => "self",
        "href" => Routes.entree_url(@endpoint, :show, entree)
      }, %{
        "class" => "entrees",
        "rel" => "parent",
        "href" => Routes.entree_url(@endpoint, :index)
      }]
    }
  end
end
