class SaleOrder < ActiveRecord::Base
  # Associations
  belongs_to :client

  # Attributes
  attr_accessible :client_id, :number, :sold_at

  # Validations
  validates :number, :sold_at, :client, presence: true
end
