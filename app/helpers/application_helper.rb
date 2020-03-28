module ApplicationHelper
  def active_class(link_path)
    current_page?(link_path) ? "nav-item active" : "nav-item"
  end
  
  def session_link
    if signed_in?
      link_to('Sign out', sign_out_path, method: :delete, class: "nav-link")
    else
      link_to('Sign in', sign_in_path, class: "nav-link")
    end
  end
end
