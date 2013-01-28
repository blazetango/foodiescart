#require 'rubygems'
#require 'active_merchant'
class Order < ActiveRecord::Base
  attr_accessible :card_expires_on, :card_number, :card_verification, :card_name, :card_type, :cart_id, :first_name, :ip_adress, :last_name, :express_token

  belongs_to :cart
  has_many :transactions, :class_name => "OrderTransaction"
  
  #validate_on_create :validate_card
#  validate :validate_card, :on => :create
  
  end 
