require 'rails_helper'

RSpec.describe User, type: :model do
  describe "relationships" do
    it { should have_many(:user_games) }
    it { should have_many(:games).through(:user_games) }
    it { should have_many(:friendships) }
    it { should have_many(:friends).through(:friendships).source(:friend) }
    it { should have_many(:inverse_friendships) }
    it { should have_many(:inverse_friends).through(:inverse_friendships).source(:user) }
  end

  describe "validations" do
    it { should validate_presence_of :username }
    it { should validate_uniqueness_of(:username).case_insensitive }
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_presence_of :password }
  end

  describe "instance methods" do
    it "friends_list" do
      user1 = User.create(username: "bob", email: "bob@turing.com", password: "ihateruby", avatar: "image1_string_goes_here.jpg")
      user2 = User.create(username: "rob", email: "rob@turing.com", password: "iloveruby", avatar: "image2_string_goes_here.jpg")
      user3 = User.create(username: "knob", email: "knob@turing.com", password: "iworshipruby", avatar: "image3_string_goes_here.jpg")
      user4 = User.create(username: "jan", email: "jan@turing.com", password: "imabeast", avatar: "image4_string_goes_here.jpg")
      user5 = User.create(username: "kat", email: "kat@turing.com", password: "bestinstructorever", avatar: "image5_string_goes_here.jpg")
      user6 = User.create(username: "abdul", email: "abdul@turing.com", password: "kingofmod2", avatar: "image6_string_goes_here.jpg")
      user7 = User.create(username: "jeff", email: "jeff@turing.com", password: "iownthisshizz", avatar: "image7_string_goes_here.jpg")

      friendship1 = Friendship.create(user_id: user1.id, friend_id: user2.id)
      friendship2 = Friendship.create(user_id: user1.id, friend_id: user3.id)
      friendship3 = Friendship.create(user_id: user1.id, friend_id: user4.id)

      friendship4 = Friendship.create(user_id: user2.id, friend_id: user3.id)
      friendship5 = Friendship.create(user_id: user2.id, friend_id: user4.id)
      friendship6 = Friendship.create(user_id: user2.id, friend_id: user5.id)
      
      friendship7 = Friendship.create(user_id: user7.id, friend_id: user1.id)

      expect(user1.friends_list.length).to eq(4)
      expect(user1.friends_list).to eq([user2, user3, user4, user7])

      expect(user3.friends_list.length).to eq(2)
      expect(user3.friends_list).to eq([user1, user2])
    end
  end
end