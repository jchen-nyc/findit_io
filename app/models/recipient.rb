class Recipient < ActiveRecord::Base
  validates :recipient_name, :presence => true
  validates :phone_number, :presence => true, :numericality => { only_integer: true }
  validates_format_of :phone_number, :with => /\A[0-9]{10}\Z/, :message => "needs to be 10 digits."
  has_many :messages , :class_name => "Message", :foreign_key => "recipient_id"
end
