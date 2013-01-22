module ApplicationHelper
  def title(product)
    product.present? ? product.title : 'tinysale'
  end

  def image_for(user, size = nil)
    image_tag(image_url(user), alt: user.username, class: "avatar", size: size)
  end

  def gravatar_for(email, size=nil)
    image_tag(gravatar_url(email), alt: "user image", class: "avatar", size: size)
  end

  private

  # user image helpers
  def image_url(user)
    user.id != 0 && user.avatar? ? user.avatar : gravatar_url(user.email.downcase)
  end

  def gravatar_url(email)
    gravatar_id = Digest::MD5::hexdigest(email)
    "https://secure.gravatar.com/avatar/#{gravatar_id}"
  end

end
