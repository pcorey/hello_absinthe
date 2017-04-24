defmodule HelloAbsinthe.Router do
  use HelloAbsinthe.Web, :router

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

  forward "/graphql", Absinthe.Plug, schema: HelloAbsinthe.Schema
  forward "/graphiql", Absinthe.Plug.GraphiQL, schema: HelloAbsinthe.Schema

  scope "/", HelloAbsinthe do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", HelloAbsinthe do
  #   pipe_through :api
  # end
end
