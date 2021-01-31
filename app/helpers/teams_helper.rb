module TeamsHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'create' || 'edit'
      team_path
    end
  end
end
