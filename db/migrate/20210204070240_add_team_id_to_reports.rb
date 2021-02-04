class AddTeamIdToReports < ActiveRecord::Migration[5.2]
  def change
    add_reference :reports, :team, foreign_key: true
  end
end
