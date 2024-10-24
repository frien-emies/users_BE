# welcome to the seeds file bro. this is where that good good happens

UserGame.destroy_all
Friendship.destroy_all
User.destroy_all
Game.destroy_all

user1 = User.create(username: "bob", email: "bob@turing.com", password: "ihateruby", avatar: "https://chess-with-frein-emies-e45d9fb62d80.herokuapp.com/images/baby.jpg")
user2 = User.create(username: "rob", email: "rob@turing.com", password: "iloveruby", avatar: "https://chess-with-frein-emies-e45d9fb62d80.herokuapp.com/images/queen.jpg")
user3 = User.create(username: "knob", email: "knob@turing.com", password: "iworshipruby", avatar: "https://chess-with-frein-emies-e45d9fb62d80.herokuapp.com/images/elephant.jpg")
user4 = User.create(username: "jan", email: "jan@turing.com", password: "imabeast", avatar: "https://chess-with-frein-emies-e45d9fb62d80.herokuapp.com/images/dog.jpg")
user5 = User.create(username: "kat", email: "kat@turing.com", password: "bestinstructorever", avatar: "https://chess-with-frein-emies-e45d9fb62d80.herokuapp.com/images/cat.jpg")
user6 = User.create(username: "abdul", email: "abdul@turing.com", password: "kingofmod2", avatar: "https://chess-with-frein-emies-e45d9fb62d80.herokuapp.com/images/pixar.jpg")
user7 = User.create(username: "jeff", email: "jeff@turing.com", password: "iownthisshizz", avatar: "https://chess-with-frein-emies-e45d9fb62d80.herokuapp.com/images/bones.jpg")

friendship1 = Friendship.create(user_id: user1.id, friend_id: user2.id)
friendship2 = Friendship.create(user_id: user1.id, friend_id: user3.id)
friendship3 = Friendship.create(user_id: user1.id, friend_id: user4.id)

friendship4 = Friendship.create(user_id: user2.id, friend_id: user3.id)
friendship5 = Friendship.create(user_id: user2.id, friend_id: user4.id)
friendship6 = Friendship.create(user_id: user2.id, friend_id: user5.id)

game1 = Game.create(game: "chess", avatar: "https://chess-with-frein-emies-e45d9fb62d80.herokuapp.com/images/chess_dab.jpg", status: 0) # active
game2 = Game.create(game: "chess", avatar: "https://chess-with-frein-emies-e45d9fb62d80.herokuapp.com/images/chess_dab.jpg", status: 0) # active
game3 = Game.create(game: "chess", avatar: "https://chess-with-frein-emies-e45d9fb62d80.herokuapp.com/images/chess_dab.jpg", status: 0) # active
game4 = Game.create(game: "chess", avatar: "https://chess-with-frein-emies-e45d9fb62d80.herokuapp.com/images/chess_dab.jpg", status: 1) # inactive

usergame1 = UserGame.create(user_id: user1.id, game_id: game1.id, player_id: 1) # active
usergame2 = UserGame.create(user_id: user2.id, game_id: game1.id, player_id: 2) # active

usergame3 = UserGame.create(user_id: user1.id, game_id: game2.id, player_id: 1) # active
usergame4 = UserGame.create(user_id: user3.id, game_id: game2.id, player_id: 2) # active

usergame5 = UserGame.create(user_id: user2.id, game_id: game3.id, player_id: 1) # active
usergame6 = UserGame.create(user_id: user3.id, game_id: game3.id, player_id: 2) # active

usergame7 = UserGame.create(user_id: user1.id, game_id: game4.id, player_id: 1) # inactive
usergame8 = UserGame.create(user_id: user3.id, game_id: game4.id, player_id: 2) # inactive