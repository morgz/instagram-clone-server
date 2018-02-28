defmodule InstagramWeb.Schema.AccountsTypes do
  use Absinthe.Schema.Notation

  object :user_session do
    field :token, non_null(:string)
  end

  object :user do
    field :id, non_null(:id)
    field :email, :string
    field :avatar, :string
    field :username, :string
  end

  enum :provider do
    value :facebook
  end
end