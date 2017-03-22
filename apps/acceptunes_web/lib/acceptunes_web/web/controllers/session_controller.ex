defmodule AcceptunesWeb.SessionController do
  use AcceptunesWeb.Web, :controller

  alias AcceptunesWeb.Schema.User
  alias AcceptunesWeb.Repositories.UserRepo

  def index(conn, _params) do
    changeset = UserRepo.changeset(%User{})
    conn |> render "index.html", changeset: changeset
  end

  def login(conn, %{"user" => user_params}) do
    changeset = UserRepo.changeset(%User{}, user_params)
    {authenticated?, user} = UserRepo.login(changeset)
    handle_login(conn, authenticated?, user, changeset)
  end

  def logout(conn, params) do
    conn
    |> Guardian.Plug.sign_out
    |> put_flash(:info, "Logged out")
    |> redirect(to: "/")
  end

  defp handle_login(conn, true, user, _changeset) do
    conn
    |> Guardian.Plug.sign_in(user)
    |> put_flash(:info, "You have been successfully logged in")
    |> redirect(to: "/")
  end
  defp handle_login(conn, false, _user, changeset) do
    conn
    |> put_flash(:error, "There was a problem authenticating your account")
    |> render("index.html", changeset: changeset)
  end

end
