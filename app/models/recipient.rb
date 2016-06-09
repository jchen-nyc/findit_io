class Recipient < ActiveRecord::Base
  validates :recipient_name, :presence => true
  validates :phone_number, :presence => true, :numericality => { only_integer: true }
  has_many :messages , :class_name => "Message", :foreign_key => "recipient_id"
end
