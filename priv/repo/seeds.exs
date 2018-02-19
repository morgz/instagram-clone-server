# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Instagram.Repo.insert!(%Instagram.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Instagram.{Posts, Repo}

mock_photo_count = 9

photo_list = [
  "https://freestocks.org/fs/wp-content/uploads/2018/02/red_tulips-800x533.jpg",
  "https://freestocks.org/fs/wp-content/uploads/2018/02/wooden_hearts-800x533.jpg",
  "https://freestocks.org/fs/wp-content/uploads/2015/11/tick_tock-800x533.jpg",
  "https://freestocks.org/fs/wp-content/uploads/2017/01/shopping_freak_3-800x533.jpg",
  "https://freestocks.org/fs/wp-content/uploads/2016/12/christmas_sweater-800x533.jpg",
  "https://freestocks.org/fs/wp-content/uploads/2016/07/guelder_rose-800x533.jpg"
]

for idx <- 0..mock_photo_count do
  photo = %{
    image_url: Enum.at(photo_list,idx),
    caption: Faker.Lorem.Shakespeare.king_richard_iii
  }

  %Posts.Photo{}
  |> Posts.Photo.changeset(photo)
  |> Repo.insert
end

