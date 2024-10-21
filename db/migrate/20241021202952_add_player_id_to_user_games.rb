class AddPlayerIdToUserGames < ActiveRecord::Migration[7.1]
  def change
    add_column :user_games, :player_id, :integer
  end
end
