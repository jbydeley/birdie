defmodule BirdieWeb.API.ProteinViewTest do
  use BirdieWeb.ConnCase, async: true
  import BirdieWeb.Factory

  alias BirdieWeb.API.ProteinView

  test "index.json" do
    protein = insert(:protein)

    rendered_protein = ProteinView.render("index.json", %{proteins: [protein]})

    assert rendered_protein == %{
      "actions" => [%{
        "name" => "Create Protein",
        "method" => "POST",
        "href" => Routes.protein_url(@endpoint, :create),
        "type" => "application/json",
        "fields" => [%{
          "name" => "name",
          "type" => "text",
          "required" => true,
        }]
      }],
      "class" => "proteins",
      "entities" => [ProteinView.render("protein-link.json", %{protein: protein})]
    }
  end

  test "protein-link.json" do
    protein = insert(:protein)

    rendered_protein = ProteinView.render("protein-link.json", %{protein: protein})

    assert rendered_protein == %{
      "class" => "protein",
      "href" => Routes.protein_url(@endpoint, :show, protein)
    }
  end

  test "show.json" do
    protein = insert(:protein)

    rendered_protein = ProteinView.render("show.json", %{protein: protein}) |> format_json

    assert rendered_protein == %{
      "actions" => [%{
        "name" => "Delete Protein",
        "method" => "DELETE",
        "href" => Routes.protein_url(@endpoint, :delete, protein)
      }, %{
        "name" => "Update protein",
        "method" => "PUT",
        "href" => Routes.protein_url(@endpoint, :update, protein),
        "type" => "application/json",
        "fields" => [%{
          "name" => "name",
          "type" => "text"
        }]
      }],
      "class" => "protein",
      "properties" => %{
        "name" => protein.name
      },
      "links" => [%{
        "class" => "protein",
        "rel" => "self",
        "href" => Routes.protein_url(@endpoint, :show, protein)
      }, %{
        "class" => "proteins",
        "rel" => "parent",
        "href" => Routes.protein_url(@endpoint, :index)
      }]
    }
  end
end
