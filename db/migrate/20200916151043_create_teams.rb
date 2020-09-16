class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|
      t.string :username
      t.string :teamname

      t.timestamps
    end
  end
end
