class AtmBanknote < ApplicationRecord
  belongs_to :atm
  belongs_to :banknote

  enum operation: { deposit: 0, withdraw: 1 }
end
