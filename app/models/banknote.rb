class Banknote < ApplicationRecord
  has_many  :atms, through: :atm_banknotes
end
