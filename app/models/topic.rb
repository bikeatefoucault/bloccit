class Topic < ActiveRecord::Base
  attr_accessible :description, :name, :public, :image
  has_many :posts, dependent: :destroy
  mount_uploader :image, ImageUploader
end
