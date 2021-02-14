module ReportsHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'create'
      confirm_team_reports_path
    elsif action_name == 'edit'
      team_report_path
    end
  end
end
