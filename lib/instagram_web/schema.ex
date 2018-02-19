defmodule InstagramWeb.Schema do
  use Absinthe.Schema
  alias InstagramWeb.Resolvers

  import_types InstagramWeb.Schema.PostsTypes
  # Query or Mutation
  query do
    @desc "Gets a list of followers photos"
    field :photos, list_of(:photo) do
      resolve &Resolvers.Posts.photos/3
    end

    @desc "Get an individual photo"
    field :photo, :photo do
      arg :id, non_null(:id)
      resolve &Resolvers.Posts.photo/3
    end

  end
end