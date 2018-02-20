defmodule InstagramWeb.Schema do
  use Absinthe.Schema
  alias InstagramWeb.Resolvers
  alias InstagramWeb.Schema.Middleware

  import_types InstagramWeb.Schema.PostsTypes
  import_types InstagramWeb.Schema.AccountsTypes

  # Query or Mutation
  query do
    @desc "Gets a list of followers photos"
    field :photos, list_of(:photo) do
      middleware Middleware.Authorize
      resolve &Resolvers.Posts.photos/3
    end

    @desc "Get an individual photo"
    field :photo, :photo do
      arg :id, non_null(:id)
      resolve &Resolvers.Posts.photo/3
    end
  end

  mutation do
    @description "Login as a user"
    field :login, :user_session do
      arg :token, :string
      arg :provider, type: :provider
      resolve &Resolvers.Accounts.login/3
    end
  end
end