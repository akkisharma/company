class Role < ApplicationRecord

	## associations
	has_many :employees

  ## validations
  validates_presence_of :name
  validates_uniqueness_of :name
end
