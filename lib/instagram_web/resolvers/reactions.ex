defmodule InstagramWeb.Resolvers.Reactions do
  alias Instagram.Reactions

  def like_photo(_, %{photo_id: photo_id}, %{context: %{current_user: current_user}}) do
    with {:ok, message} <- Reactions.like_photo(photo_id, current_user.id) do
      {:ok, message}
    end
  end

  def user_likes_photo(%{id: photo_id},_, %{context: %{current_user: current_user}}) do
    with {:ok, message} <- Reactions.user_likes_photo(photo_id, current_user.id) do
      {:ok, message}
    end
  end

end