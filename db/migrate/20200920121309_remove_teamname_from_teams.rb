class RemoveTeamnameFromTeams < ActiveRecord::Migration[6.0]
  def change
       remove_column :teams, :teamname, :string
  end
end

