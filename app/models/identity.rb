class Identity < ActiveRecord::Base
  belongs_to :user

  serialize :omniauth_credentials
  serialize :omniauth_extra
  serialize :omniauth_info

  scope :for_provider, lambda { |provider| where(provider: provider) }

  def self.find_or_create_by_omniauth_hash(auth_hash)
    where(provider: auth_hash[:provider], uid: auth_hash[:uid]).first_or_create do |identity|
      [:credentials, :extra, :info].each do |sym|
        identity.send(:"omniauth_#{sym}=", auth_hash[sym])
      end
    end
  end

  def provider=(provider)
    super

    self.type = self.class.type_from_provider(provider)
  end

  def first_name
    info[:first_name]
  end

  def last_name
    info[:last_name]
  end

  def image
  end

  def url
    info[:urls][:"#{provider.capitalize}"]
  end

  private
  def self.type_from_provider(provider)
    # make this simple until we might need a case statement
    "#{self.to_s.pluralize}::#{provider.camelize}"
  end
end
