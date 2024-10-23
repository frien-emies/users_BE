# welcome to the seeds file bro. this is where that good good happens

UserGame.destroy_all
Friendship.destroy_all
User.destroy_all
Game.destroy_all

user1 = User.create(username: "bob", email: "bob@turing.com", password: "ihateruby", avatar: "baby.jpg")
user2 = User.create(username: "rob", email: "rob@turing.com", password: "iloveruby", avatar: "app/assets/images/queen.jpg")
user3 = User.create(username: "knob", email: "knob@turing.com", password: "iworshipruby", avatar: "app/assets/images/elephant.jpg")
user4 = User.create(username: "jan", email: "jan@turing.com", password: "imabeast", avatar: "app/assets/images/dog.jpg")
user5 = User.create(username: "kat", email: "kat@turing.com", password: "bestinstructorever", avatar: "app/assets/images/cat.jpg")
user6 = User.create(username: "abdul", email: "abdul@turing.com", password: "kingofmod2", avatar: "app/assets/images/queen.jpg")
user7 = User.create(username: "jeff", email: "jeff@turing.com", password: "iownthisshizz", avatar: "app/assets/images/bones.jpg")

friendship1 = Friendship.create(user_id: user1.id, friend_id: user2.id)
friendship2 = Friendship.create(user_id: user1.id, friend_id: user3.id)
friendship3 = Friendship.create(user_id: user1.id, friend_id: user4.id)

friendship4 = Friendship.create(user_id: user2.id, friend_id: user3.id)
friendship5 = Friendship.create(user_id: user2.id, friend_id: user4.id)
friendship6 = Friendship.create(user_id: user2.id, friend_id: user5.id)

game1 = Game.create(game: "chess", avatar: "chess_image_string_goes_here.jpg", status: 0) # active
game2 = Game.create(game: "chess", avatar: "chess_image_string_goes_here.jpg", status: 0) # active
game3 = Game.create(game: "chess", avatar: "chess_image_string_goes_here.jpg", status: 0) # active
game4 = Game.create(game: "checkers", avatar: "checkers_image_string_goes_here.jpg", status: 0) # inactive

usergame1 = UserGame.create(user_id: user1.id, game_id: game1.id, player_id: 1)
usergame2 = UserGame.create(user_id: user2.id, game_id: game1.id, player_id: 2)

usergame3 = UserGame.create(user_id: user1.id, game_id: game2.id, player_id: 1)
usergame4 = UserGame.create(user_id: user3.id, game_id: game2.id, player_id: 2)

usergame5 = UserGame.create(user_id: user2.id, game_id: game3.id, player_id: 1)
usergame6 = UserGame.create(user_id: user3.id, game_id: game3.id, player_id: 2)