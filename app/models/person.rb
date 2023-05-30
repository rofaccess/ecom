class Person < ActiveRecord::Base
  # Associations
  belongs_to :client
  belongs_to :user

  # Attributes
  attr_accessible :address, :document_number, :first_name, :last_name, :phone, :client_id
end
