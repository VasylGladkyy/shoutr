module UsersHelper
  def follow_button(user)
    return if current_user.is_a?(Guest)

    if current_user.following?(user)
      button_to 'Unfollow',
                unfollow_user_path(user),
                method: :delete, class: 'btn btn-primary ml-5 mt-3'
    else
      button_to 'Follow',
                follow_user_path(user),
                class: 'btn btn-primary ml-5 mt-3'
    end
  end
end
