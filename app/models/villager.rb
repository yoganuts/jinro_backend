class Villager < ApplicationRecord
  belongs_to :village
  belongs_to :role
end
