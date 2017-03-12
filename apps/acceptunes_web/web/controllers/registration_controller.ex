defmodule AcceptunesWeb.RegistrationController do
  use AcceptunesWeb.Web, :controller
  require IEx
  alias AcceptunesWeb.Repositories.UserRepo

  def new(conn, _params) do
    render conn, changeset: UserRepo.changeset()
  end

  def create(conn, %{"user" => user_params}) do
    case UserRepo.create(user_params) do
      {:ok, changeset} -> 
        IEx.pry
        conn
        |> Guardian.Plug.sign_in(changeset)
        |> put_flash(:info, "Your account has been created")
        |> redirect(to: "/")
      {:error, changeset} -> 
        conn
        |> put_flash(:error, "Unable to create your account")
        |> render("new.html", changeset: changeset)
    end
  end
end
