defmodule InstagramWeb.Schema.PostsTypes do
  use Absinthe.Schema.Notation
  alias InstagramWeb.Resolvers

  object :photo do
    field :id, non_null(:id)
    field :image_url, non_null(:string)
    field :caption, :string
    field :likes_photo, non_null(:boolean) do
      resolve &Resolvers.Reactions.user_likes_photo/3
    end

    field :inserted_at, non_null(:string)
    field :updated_at, non_null(:string)
  end

  object :presign_url do
    field :url, non_null(:string)
    field :upload_url, non_null(:string)
  end

end