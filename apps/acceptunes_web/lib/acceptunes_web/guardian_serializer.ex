defmodule AcceptunesWeb.GuardianSerializer do
  @behaviour Guardian.Serializer

  require IEx

  alias AcceptunesWeb.Repositories.UserRepo
  alias AcceptunesWeb.Schema.User

  def for_token(user = %User{}), do: { :ok, "User:#{user.id}" }
  def for_token(_), do: { :error, "Unknown resource type" }

  def from_token("User:" <> id) do
    user = id
           |> String.trim
           |> String.to_integer
           |> UserRepo.get_user_by_id
    { :ok, user}
  end

  def from_token(_), do: { :error, "Unknown resource type" }
end
