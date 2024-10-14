# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

UserGame.destroy_all
Friendship.destroy_all
User.destroy_all
Game.destroy_all

user1 = User.create(username: "bob", email: "bob@turing.com", password: "ihateruby", avatar: "image1_string_goes_here.jpg")
user2 = User.create(username: "rob", email: "rob@turing.com", password: "iloveruby", avatar: "image2_string_goes_here.jpg")
user3 = User.create(username: "knob", email: "knob@turing.com", password: "iworshipruby", avatar: "image3_string_goes_here.jpg")
user4 = User.create(username: "jan", email: "jan@turing.com", password: "imabeast", avatar: "image4_string_goes_here.jpg")
user5 = User.create(username: "kat", email: "kat@turing.com", password: "bestinstructorever", avatar: "image5_string_goes_here.jpg")
user6 = User.create(username: "abdul", email: "abdul@turing.com", password: "kingofmod2", avatar: "image6_string_goes_here.jpg")
user7 = User.create(username: "jeff", email: "jeff@turing.com", password: "iownthisshizz", avatar: "image7_string_goes_here.jpg")
user8 = User.create(username: "chatgpt", email: "chatgpt@turing.com", password: "robotoverlords", avatar: "image8_string_goes_here.jpg")

friendship1 = Friendship.create(user_id: user1.id, friend_id: user2.id)
friendship2 = Friendship.create(user_id: user1.id, friend_id: user3.id)
friendship3 = Friendship.create(user_id: user1.id, friend_id: user4.id)

friendship4 = Friendship.create(user_id: user2.id, friend_id: user3.id)
friendship5 = Friendship.create(user_id: user2.id, friend_id: user4.id)
friendship6 = Friendship.create(user_id: user2.id, friend_id: user5.id)

game1 = Game.create(game: "chess", avatar: "chess_image_string_goes_here.jpg")
game2 = Game.create(game: "checkers", avatar: "checkers_image_string_goes_here.jpg")

usergame1 = UserGame.create(user_id: user1.id, game_id: game1.id)
usergame2 = UserGame.create(user_id: user2.id, game_id: game1.id)

usergame3 = UserGame.create(user_id: user1.id, game_id: game1.id)
usergame4 = UserGame.create(user_id: user3.id, game_id: game1.id)

usergame5 = UserGame.create(user_id: user2.id, game_id: game1.id)
usergame6 = UserGame.create(user_id: user3.id, game_id: game1.id)