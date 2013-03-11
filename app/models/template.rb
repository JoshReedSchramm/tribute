class Template < ActiveRecord::Base
  attr_accessible :class_name, :created_by_id, :description, :name

  belongs_to :created_by, class_name: "User"
  has_many :pages

  validates :name, :presence => true
  validates :class_name, :presence => true
end
