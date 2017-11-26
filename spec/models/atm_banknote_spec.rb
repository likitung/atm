require 'rails_helper'

RSpec.describe AtmBanknote, type: :model do
  it { should belong_to(:atm) }
  it { should belong_to(:banknote) }
end
