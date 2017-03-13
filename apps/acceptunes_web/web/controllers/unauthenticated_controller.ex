defmodule AcceptunesWeb.UnauthenticatedController do
  use AcceptunesWeb.Web, :controller

  def unauthenticated(conn, params) do
    conn
    |> put_flash(:error, "Authentication Required")
    |> redirect(to: "/login")
  end
end
