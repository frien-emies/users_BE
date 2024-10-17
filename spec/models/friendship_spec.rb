require 'rails_helper'

RSpec.describe Friendship, type: :model do
  describe "relationships" do
    it { should belong_to(:user) }
    it { should belong_to(:friend) }
  end

  describe "validations" do
    user1 = FactoryBot.create(:user)
    user2 = FactoryBot.create(:user)
    self_friendship = Friendship.create!(user_id: user1.id, friend_id: user2.id)
    it { should validate_uniqueness_of(:user_id).scoped_to(:friend_id) }
  end

  describe "class methods" do
    it 'not_self' do
      user1 = User.create!(username: "jeff", email: "jeff@turing.com", password: "ihateruby", avatar: "image3_string_goes_here.jpg")
      user2 = User.create!(username: "abdul", email: "abdul@turing.com", password: "iloverails", avatar: "image4_string_goes_here.jpg")
      self_friendship = Friendship.new(user_id: user1.id, friend_id: user1.id)
      
      expect(self_friendship).not_to be_valid
      expect(self_friendship.errors[:friend_id]).to include("can't be the same as user")
    end
  end
end