class CreateGames < ActiveRecord::Migration[7.1]
  def change
    create_table :games do |t|
      t.string :game
      t.string :avatar

      t.timestamps
    end
  end
end
