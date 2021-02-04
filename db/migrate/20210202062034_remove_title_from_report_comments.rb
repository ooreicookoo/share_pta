class RemoveTitleFromReportComments < ActiveRecord::Migration[5.2]
  def change
    remove_column :report_comments, :comment_title, :string
  end
end
