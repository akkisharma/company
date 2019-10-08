
class Employee < ApplicationRecord

	## to import herarchy
	has_ancestry

  ## associations
  belongs_to :role

  ## validations
  validates_presence_of :name, :email, :salary, :rating, :role
  validates_uniqueness_of :email

end

