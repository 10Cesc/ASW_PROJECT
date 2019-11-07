class Priority < ApplicationRecord
  validates :name, :presence => true, :uniqueness => true
end
