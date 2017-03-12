defmodule AcceptunesWeb.Factory do
  use ExMachina.Ecto, repo: AcceptunesWeb.Repo

  alias AcceptunesWeb.Schema.User

  def user_factory do
    %User{ 
      first_name: sequence("John"),
      last_name: sequence("Smith"),
      email: sequence(:email, &"me-#{&1}@foo.com"),
      password: sequence("passwordasdf")
    }
  end
end
