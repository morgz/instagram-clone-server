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

    @desc "get a presigned url for uploading a photo"
    field :presign_url, :presign_url do
      middleware Middleware.Authorize
      resolve &Resolvers.Posts.presign_url/3
    end

    @desc "Get all comments for a photo"
    field :comments, non_null(list_of(:comment)) do
      middleware Middleware.Authorize
      arg :photo_id, non_null(:id)
      resolve &Resolvers.Posts.get_comments/3
    end
  end

  mutation do
    @description "Login as a user"
    field :login, :user_session do
      arg :token, :string
      arg :provider, type: :provider
      resolve &Resolvers.Accounts.login/3
    end

    @desc "like or unlike a photo"
    field :like_photo, :boolean do
      middleware Middleware.Authorize
      arg :photo_id, non_null(:id)
      resolve &Resolvers.Reactions.like_photo/3
    end

    @desc "Create a photo"
    field :create_photo, :photo do
      middleware Middleware.Authorize
      arg :image_url, :string
      arg :caption, :string
      resolve &Resolvers.Posts.create_photo/3
    end

    @desc "Create a comment for a photo"
    field :create_comment, :comment do
      middleware Middleware.Authorize
      arg :photo_id, non_null(:id)
      arg :text, non_null(:string)
      resolve &Resolvers.Posts.create_comment/3
    end
  end
end