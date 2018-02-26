import Integer, only: [is_odd: 1]

alias Instagram.{Posts, Repo, Accounts}

mock_user_count = 5

# Users

for idx <- 1..mock_user_count do
  gender = if (is_odd(idx)), do: "men", else: "women"
  avatar_url = "https://randomuser.me/api/portrait/#{gender}/#{idx}.jpg"

  user = %{
    email: Faker.Internet.email,
    avatar: avatar_url,
    username: Faker.Internet.user_name,
    facebook_id: "#{idx}"
  }

  %Accounts.User{}
  |> Accounts.User.changeset(user)
  |> Repo.insert!
end


# Photos

mock_photo_count = 6

photo_list = [
  "https://freestocks.org/fs/wp-content/uploads/2018/02/red_tulips-800x533.jpg",
  "https://freestocks.org/fs/wp-content/uploads/2018/02/wooden_hearts-800x533.jpg",
  "https://freestocks.org/fs/wp-content/uploads/2015/11/tick_tock-800x533.jpg",
  "https://freestocks.org/fs/wp-content/uploads/2017/01/shopping_freak_3-800x533.jpg",
  "https://freestocks.org/fs/wp-content/uploads/2016/12/christmas_sweater-800x533.jpg",
  "https://freestocks.org/fs/wp-content/uploads/2016/07/guelder_rose-800x533.jpg"
]

for idx <- 1..mock_photo_count do
  photo = %{
    image_url: Enum.at(photo_list,idx-1),
    caption: Faker.Lorem.Shakespeare.king_richard_iii,
    user_id: Enum.random(1..mock_user_count)
  }

  %Posts.Photo{}
  |> Posts.Photo.changeset(photo)
  |> Repo.insert!
end

