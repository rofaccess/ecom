class Person < ActiveRecord::Base
  attr_accessible :address, :document_number, :first_name, :last_name, :phone
end
