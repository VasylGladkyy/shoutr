module UsersHelper
  def follow_button(user)
    if current_user.following?(user)
      button_to "Unfollow", unfollow_user_path(user), method: :delete, class: "btn btn-primary ml-5 mt-3 mb-2"
    else
      button_to "Follow", follow_user_path(user), class: "btn btn-primary ml-5 mt-3 mb-2"
    end
  end
end