module ApplicationHelper
  def admin_bar
    render partial: 'layouts/application_elements/admin_bar' if user_signed_in?
  end
end
