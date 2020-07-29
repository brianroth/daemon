class Customer < ActiveRecord::Base
  has_many :orders

  def to_s
  	as_json
  end
end