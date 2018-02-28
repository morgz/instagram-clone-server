defmodule Instagram.Reactions do
  @moduledoc """
  The Reaction context.
  """

  import Ecto.Query, warn: false
  alias Instagram.Repo

  alias Instagram.Reactions.LikePhoto

  def like_photo(photo_id, user_id) do
    result = get_like_photo(photo_id, user_id)

    case result do
      nil ->
        create_like_photo(%{user_id: user_id, photo_id: photo_id})
        {:ok, true}
      _ ->
        delete_like_photo(result)
        {:ok, false}
    end
  end

  def user_likes_photo(photo_id, user_id) when is_integer(photo_id) do
    result = get_like_photo(photo_id, user_id)

    case result do
      nil -> {:ok, false}
      _ -> {:ok, true}
    end
  end

  def user_likes_photo(photo, user_id) do
    Enum.map(photo.likes, fn(x) -> x.user_id end) |> Enum.any?(fn(x) -> x == user_id end)
  end

  # @doc """
  # Returns the list of like_photos.

  # ## Examples

  #     iex> list_like_photos()
  #     [%LikePhoto{}, ...]

  # """
  # def list_like_photos do
  #   Repo.all(LikePhoto)
  # end

  # @doc """
  # Gets a single like_photo.

  # Raises `Ecto.NoResultsError` if the Like photo does not exist.

  # ## Examples

  #     iex> get_like_photo!(123)
  #     %LikePhoto{}

  #     iex> get_like_photo!(456)
  #     ** (Ecto.NoResultsError)

  # """
  # def get_like_photo!(id), do: Repo.get!(LikePhoto, id)

  @doc """
  Creates a like_photo.

  ## Examples

      iex> create_like_photo(%{field: value})
      {:ok, %LikePhoto{}}

      iex> create_like_photo(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_like_photo(attrs \\ %{}) do
    %LikePhoto{}
    |> LikePhoto.changeset(attrs)
    |> Repo.insert()
  end

    @doc """
  Deletes a LikePhoto.

  ## Examples

      iex> delete_like_photo(like_photo)
      {:ok, %LikePhoto{}}

      iex> delete_like_photo(like_photo)
      {:error, %Ecto.Changeset{}}

  """
  def delete_like_photo(%LikePhoto{} = like_photo) do
    Repo.delete(like_photo)
  end

  # @doc """
  # Updates a like_photo.

  # ## Examples

  #     iex> update_like_photo(like_photo, %{field: new_value})
  #     {:ok, %LikePhoto{}}

  #     iex> update_like_photo(like_photo, %{field: bad_value})
  #     {:error, %Ecto.Changeset{}}

  # """
  # def update_like_photo(%LikePhoto{} = like_photo, attrs) do
  #   like_photo
  #   |> LikePhoto.changeset(attrs)
  #   |> Repo.update()
  # end



  # @doc """
  # Returns an `%Ecto.Changeset{}` for tracking like_photo changes.

  # ## Examples

  #     iex> change_like_photo(like_photo)
  #     %Ecto.Changeset{source: %LikePhoto{}}

  # """
  # def change_like_photo(%LikePhoto{} = like_photo) do
  #   LikePhoto.changeset(like_photo, %{})
  # end


  defp get_like_photo(photo_id, user_id) do
    query = from lp in LikePhoto,
    where: lp.photo_id == ^photo_id and lp.user_id == ^user_id

    Repo.one(query)
  end


end
