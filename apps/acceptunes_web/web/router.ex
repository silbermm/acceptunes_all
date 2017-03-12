defmodule AcceptunesWeb.Router do
  use AcceptunesWeb.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :browser_auth do
    plug Guardian.Plug.VerifySession
    plug Guardian.Plug.LoadResource
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", AcceptunesWeb do
    pipe_through [:browser, :browser_auth]

    resources "/registration", RegistrationController, only: [:new, :create]
    get "/login", SessionController, :index
    get "/logout", SessionController, :logout

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", AcceptunesWeb do
  #   pipe_through :api
  # end
end
