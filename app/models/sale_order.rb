class SaleOrder < ActiveRecord::Base
  belongs_to :client

  attr_accessible :client_id, :number, :sold_at
end
