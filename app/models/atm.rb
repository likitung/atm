class Atm < ApplicationRecord
  has_many  :banknotes, through: :atm_banknotes
end
