defmodule BirdieWeb.Router do
  use BirdieWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", BirdieWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", BirdieWeb.API do
    pipe_through :api

    resources "/toppings", ToppingController, except: [:new, :edit]
    resources "/proteins", ProteinController, except: [:new, :edit]
    resources "/sauces", SauceController, except: [:new, :edit]
    resources "/entrees", EntreeController, except: [:new, :edit]
    resources "/orders", OrderController, except: [:new, :edit] do
      resources "/items", OrderItemController, except: [:new, :edit] do
        resources "/toppings", ToppingController, only: [:index]
      end
    end
  end
end
