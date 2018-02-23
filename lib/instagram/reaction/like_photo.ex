defmodule Instagram.Reaction.LikePhoto do
  use Ecto.Schema
  import Ecto.Changeset
  alias Instagram.Reaction.LikePhoto


  schema "like_photos" do
    field :user_id, :id
    field :photo_id, :id

    timestamps()
  end

  @doc false
  def changeset(%LikePhoto{} = like_photo, attrs) do
    like_photo
    |> cast(attrs, [])
    |> validate_required([])
  end
end
