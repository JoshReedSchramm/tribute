class Page < ActiveRecord::Base
  attr_accessible :description, :main_image, :name, :tagline, :template_id

  belongs_to :owner, class_name: "User"
  belongs_to :template

  validates :template_id, presence: true
  validates :name, presence: true
end
