class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :player
      t.integer :trainer_id
      t.string :playerName
      t.string :position
      t.integer :league_id

      t.timestamps
    end
  end
end
