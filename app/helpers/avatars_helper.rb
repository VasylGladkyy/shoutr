module AvatarsHelper
  def avatar(user)
    email_digest = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "//www.gravatar.com/avatar/#{email_digest}"
    image_tag(gravatar_url, class: "avatar")
  end
end