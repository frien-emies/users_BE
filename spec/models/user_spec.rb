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
end