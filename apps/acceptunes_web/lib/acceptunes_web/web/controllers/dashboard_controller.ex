defmodule AcceptunesWeb.DashboardController do
  use AcceptunesWeb.Web, :controller

  plug Guardian.Plug.EnsureAuthenticated, handler: UnauthenticatedController

  def index(conn, _params) do
    
    render conn, "index.html"
  end
end
