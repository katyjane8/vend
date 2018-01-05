class Snack < ApplicationRecord
  validates_presence_of :name, :price
  has_many :machines, through: :machine_snacks
end
