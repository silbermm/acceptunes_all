defmodule AcceptunesWeb.Repositories.UserRepo do
  @moduledoc """
  API to get/set user info from the Acceptunes database
  """
  import Ecto.Changeset
  require Logger
  alias AcceptunesWeb.Repo
  alias AcceptunesWeb.Schema.User

  @doc """
  Get user by ID
  """
  @spec get_user_by_id(number) :: {:ok, %User{}} | {:error, String.t}
  def get_user_by_id(id) do
    Repo.get(User, id)
  end

  def login(changeset) do
    user = Repo.get_by(User, email: changeset.changes.email)
    authenticated? = Comeonin.Bcrypt.checkpw(changeset.changes.password, user.crypted_password)
    {authenticated?, user}
  end

  def create(user_params) do
    %User{}
    |> User.changeset(user_params)
    |> put_change(:crypted_password, hashed_password(user_params["password"]))
    |> Repo.insert()
  end

  def update_profile(user, user_params) do
    user
    |> User.profile_changeset(user_params)
    |> Repo.update()
  end

  def profile_changeset(model \\ %User{}, params \\ %{}) do
    User.profile_changeset(model, params)
  end
  def changeset(model \\ %User{}, params \\ %{}) do
    User.changeset(model, params)
  end

  defp hashed_password(password) do
    Comeonin.Bcrypt.hashpwsalt(password)
  end
end
