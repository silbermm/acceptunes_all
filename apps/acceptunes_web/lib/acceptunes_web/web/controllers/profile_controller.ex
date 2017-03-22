defmodule AcceptunesWeb.ProfileController do
  use AcceptunesWeb.Web, :controller
  alias AcceptunesWeb.Schema.User
  alias AcceptunesWeb.Repositories.UserRepo
  alias AcceptunesWeb.UnauthenticatedController

  plug Guardian.Plug.EnsureAuthenticated, handler: UnauthenticatedController

  def index(conn, _params) do
    user = Guardian.Plug.current_resource(conn)
    changeset = UserRepo.profile_changeset(user)
    render conn, changeset: changeset
  end

  def update(conn, %{"user" => user_params}) do
    # make sure the user is updating themselves
    user = Guardian.Plug.current_resource(conn)
    case UserRepo.update_profile(user, user_params) do
      {:ok, new_user } ->
        conn
        |> put_flash(:info, "Profile updated successfully!")
        |> render "index.html", changeset: UserRepo.profile_changeset(new_user)
      {:error, changeset} -> 
        conn
        |> put_flash(:error, "Unable to update your profile")
        |> render "index.html", changeset: changeset
    end
  end
end
