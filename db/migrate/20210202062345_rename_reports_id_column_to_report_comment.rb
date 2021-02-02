class RenameReportsIdColumnToReportComment < ActiveRecord::Migration[5.2]
  def change
    rename_column :report_comments, :reports_id, :report_id
  end
end
