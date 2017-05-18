defmodule GreenMonster.Web.Router do
  use GreenMonster.Web, :router

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

  scope "/", GreenMonster.Web do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/auth", GreenMonster.Web do
    pipe_through :browser
    get  "/signin", SessionController, :request
    get  "/:provider/callback", SessionController, :callback
  end

  # Other scopes may use custom stacks.
  # scope "/api", GreenMonster.Web do
  #   pipe_through :api
  # end
end
