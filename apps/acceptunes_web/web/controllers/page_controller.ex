defmodule AcceptunesWeb.PageController do
  use AcceptunesWeb.Web, :controller

  def index(conn, _params) do
    user = Guardian.Plug.current_resource(conn)
    render conn, "index.html", user: user
  end
end
