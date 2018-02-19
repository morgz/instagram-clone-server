defmodule Instagram.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Instagram.Accounts.User


  schema "users" do
    field :avatar, :string
    field :email, :string
    field :facebook_id, :string
    field :first_namne, :string
    field :last_name, :string
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:username, :avatar, :facebook_id, :email, :first_namne, :last_name])
    |> validate_required([:username, :avatar, :facebook_id, :email, :first_namne, :last_name])
    |> unique_constraint(:email)
  end
end