class AtmBanknote < ApplicationRecord
  belongs_to :atm
  belongs_to :banknote
end
