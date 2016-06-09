class Item < ActiveRecord::Base
  has_many :messages , :class_name => "Message", :foreign_key => "item_id"
  belongs_to :user
end
