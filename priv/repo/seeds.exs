# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Birdie.Repo.insert!(%Birdie.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Birdie.Repo
alias Birdie.Entrees.Entree
alias Birdie.Proteins.Protein
alias Birdie.Ingredients.{Sauce, Topping}
alias Birdie.Orders.{Order, OrderItem, OrderItemSauce, OrderItemTopping}

# Entrees

entree = Repo.insert!(%Entree{name: "Burrito"})
Repo.insert!(%Entree{name: "Taco"})
Repo.insert!(%Entree{name: "Quesadilla"})
Repo.insert!(%Entree{name: "Naked"})

# Proteins

protein = Repo.insert!(%Protein{name: "Chipotle Beef"})
Repo.insert!(%Protein{name: "Chicken"})
Repo.insert!(%Protein{name: "Pork"})
Repo.insert!(%Protein{name: "Vegetables"})
Repo.insert!(%Protein{name: "Chorizo"})
Repo.insert!(%Protein{name: "Shrimp"})
Repo.insert!(%Protein{name: "Ancho Beef"})

# Ingredients

topping = Repo.insert!(%Topping{name: "Refried Beans"})
Repo.insert!(%Topping{name: "Black Beans"})
Repo.insert!(%Topping{name: "Rice"})
Repo.insert!(%Topping{name: "Lettuce"})
Repo.insert!(%Topping{name: "Cheese"})
Repo.insert!(%Topping{name: "Guacamole"})
Repo.insert!(%Topping{name: "Green Peppers"})
Repo.insert!(%Topping{name: "Corn Salsa"})
Repo.insert!(%Topping{name: "Mild Salsa", spice: 1})
Repo.insert!(%Topping{name: "Red Onions"})
Repo.insert!(%Topping{name: "Jalapenos", spice: 4})
Repo.insert!(%Topping{name: "Salsa Verde", spice: 1})
Repo.insert!(%Topping{name: "Cilantro"})
Repo.insert!(%Topping{name: "Tomatoes"})

# Sauces

sauce = Repo.insert!(%Sauce{name: "Sour Cream"})
Repo.insert!(%Sauce{name: "Medium Chipotle", spice: 2})
Repo.insert!(%Sauce{name: "Burrito Sauce", spice: 1})
Repo.insert!(%Sauce{name: "Habenero Hot", spice: 5})
Repo.insert!(%Sauce{name: "Roasted Red Peppers"})

order = Repo.insert!(%Order{first_name: "Jared", last_name: "Bydeley"})
order_item = Repo.insert!(%OrderItem{order_id: order.id, entree_id: entree.id, protein_id: protein.id})
Repo.insert!(%OrderItemSauce{sauce_id: sauce.id, order_item_id: order_item.id})
Repo.insert!(%OrderItemTopping{topping_id: topping.id, order_item_id: order_item.id})
