class Message < ActiveRecord::Base
  validates :message, :presence => true
  belongs_to :item , :class_name => "Item", :foreign_key => "item_id"
  belongs_to :recipient , :class_name => "Recipient", :foreign_key => "recipient_id"
  belongs_to :user
end
