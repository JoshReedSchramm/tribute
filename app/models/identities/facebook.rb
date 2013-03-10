class Identities::Facebook < Identity
  def contacts
    fb_graph.friends
  end

  def first_name
    omniauth_info[:first_name]
  end

  def email
    omniauth_info[:email]
  end

  def username
    omniauth_info[:nickname]
  end

  def image
    "http://graph.facebook.com/#{uid}/picture?type=large"
  end

  def last_name
    omniauth_info[:last_name]
  end

  private
  def fb_graph
    @fb_graph ||= FbGraph::User.fetch(uid, access_token: omniauth_credentials[:token])
  end
end
