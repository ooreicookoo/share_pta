class AddTeamIdToReports < ActiveRecord::Migration[5.2]
  def change
    add_column :reports, :team_id, :string
  end
end
