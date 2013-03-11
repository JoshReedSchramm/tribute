class Page < ActiveRecord::Base
  attr_accessible :description, :main_image, :name, :tagline, :template_id

  belongs_to :owner, class_name: "User"
  belongs_to :template

  validates :template_id, presence: true
  validates :name, presence: true

  def allows_editor?(user)
    return false if user.nil?
    return user.admin? || self.owner == user
  end
end
