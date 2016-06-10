class Item < ActiveRecord::Base
  validates :item_name, :presence => true
  validates :image, :presence => true
  validates :location, :presence => true
  has_many :messages , :class_name => "Message", :foreign_key => "item_id"
  belongs_to :user
  mount_uploader :image, ImageUploader
end
