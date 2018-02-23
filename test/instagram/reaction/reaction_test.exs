defmodule Instagram.ReactionTest do
  use Instagram.DataCase

  alias Instagram.Reactions

  describe "like_photos" do
    alias Instagram.Reactions.LikePhoto

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def like_photo_fixture(attrs \\ %{}) do
      {:ok, like_photo} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Reactions.create_like_photo()

      like_photo
    end

    test "list_like_photos/0 returns all like_photos" do
      like_photo = like_photo_fixture()
      assert Reactions.list_like_photos() == [like_photo]
    end

    test "get_like_photo!/1 returns the like_photo with given id" do
      like_photo = like_photo_fixture()
      assert Reactions.get_like_photo!(like_photo.id) == like_photo
    end

    test "create_like_photo/1 with valid data creates a like_photo" do
      assert {:ok, %LikePhoto{} = like_photo} = Reactions.create_like_photo(@valid_attrs)
    end

    test "create_like_photo/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Reactions.create_like_photo(@invalid_attrs)
    end

    test "update_like_photo/2 with valid data updates the like_photo" do
      like_photo = like_photo_fixture()
      assert {:ok, like_photo} = Reactions.update_like_photo(like_photo, @update_attrs)
      assert %LikePhoto{} = like_photo
    end

    test "update_like_photo/2 with invalid data returns error changeset" do
      like_photo = like_photo_fixture()
      assert {:error, %Ecto.Changeset{}} = Reactions.update_like_photo(like_photo, @invalid_attrs)
      assert like_photo == Reactions.get_like_photo!(like_photo.id)
    end

    test "delete_like_photo/1 deletes the like_photo" do
      like_photo = like_photo_fixture()
      assert {:ok, %LikePhoto{}} = Reactions.delete_like_photo(like_photo)
      assert_raise Ecto.NoResultsError, fn -> Reactions.get_like_photo!(like_photo.id) end
    end

    test "change_like_photo/1 returns a like_photo changeset" do
      like_photo = like_photo_fixture()
      assert %Ecto.Changeset{} = Reactions.change_like_photo(like_photo)
    end
  end
end
