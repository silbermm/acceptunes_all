defmodule AcceptunesWeb.SessionController do
  use AcceptunesWeb.Web, :controller

  def index(conn, _params) do
    conn |> render "index.html"
  end

  def login(conn, params) do

  end

  def logout(conn, params) do
    conn
    |> Guardian.Plug.sign_out
    |> put_flash(:info, "Logged out")
    |> redirect(to: "/")
  end

end
