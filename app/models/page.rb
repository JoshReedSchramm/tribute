class Page < ActiveRecord::Base
  extend FriendlyId

  attr_accessible :description, :main_image, :name, :tagline, :template_id,
                  :main_image_cache

  belongs_to :owner, class_name: "User"
  belongs_to :template

  validates :template_id, presence: true
  validates :name, presence: true

  friendly_id :name, use: :slugged

  mount_uploader :main_image, PhotoUploader

  def allows_editor?(user)
    return false if user.nil?
    return user.admin? || self.owner == user
  end
end
