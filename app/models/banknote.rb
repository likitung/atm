class Banknote < ApplicationRecord
  has_many  :atms, through: :atm_banknotes

  validates :value, presence: true
  validates :value, uniqueness: true
end
