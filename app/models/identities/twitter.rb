class Identities::Twitter < Identity
  CONFIG = YAML::load_file("#{Rails.root}/config/omniauth/twitter.yml")[Rails.env]

  def contacts
    @contacts ||= twitter_client.friends.all
  end

  # first name is all characters before the rightmost space
  # e.g. Jesus H. Christ -> Jesus H.
  def first_name
    omniauth_info[:name].slice(/.*?(?=\s?[^ ]+$)/)
  end

  # last name is all characters after the rightmost space
  # e.g. Jesus H. Christ -> Christ
  def last_name
    omniauth_info[:name].slice(/[^ ]+$/)
  end

  def email
    ""
  end

  # Twitter only returns a smaller image; this is the full size
  def image
    omniauth_info[:image].sub(/_normal(?=\.\w{3}$)/, '')
  end

  private
  def twitter_client
    @twitter_client ||= Twitter::Client.new({
      consumer_key:       CONFIG["key"],
      consumer_secret:    CONFIG["secret"],
      oauth_token:        omniauth_credentials[:token],
      oauth_token_secret: omniauth_credentials[:secret]
    })
  end
end
