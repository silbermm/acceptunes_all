defmodule AcceptunesWeb.Schema.User do
  use AcceptunesWeb.Web, :model

  schema "users" do
    field :first_name, :string
    field :last_name, :string
    field :email, :string
    field :crypted_password, :string
    field :password, :string, virtual: true
    field :rally_token, :string
    timestamps()
  end

  @required_fields ~w(email password)
  @optional_fields ~w(first_name last_name)

  def changeset(model, params \\ %{}) do
    model
    |> cast(params, [:email, :password, :first_name, :last_name])
    |> validate_required([:email, :password])
    |> unique_constraint(:email)
    |> validate_format(:email, ~r/@/)
    |> validate_length(:password, min: 5)
  end

  def profile_changeset(model, params \\ %{}) do
    model
    |> cast(params, ~w(email first_name last_name rally_token))
    |> unique_constraint(:email)
    |> validate_format(:email, ~r/@/)
  end

end
