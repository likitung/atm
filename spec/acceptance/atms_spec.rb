require 'spec_helper'
require 'rails_helper'
require 'acceptance_helper'

RSpec.resource Atm, type: %i[request api acceptance] do
  resource 'ATMs' do
    post '/api/v1/atms', format: :json do
      with_options scope: :atm do
        parameter :name, 'Name of ATM', required: false
      end

      let(:name) { 'ATM name' }

      example_request 'Created ATM' do
        expect(response_status).to eq(201)
      end
    end

    post '/api/v1/atms/:id/deposit', format: :json do
      with_options scope: :banknote do
        parameter '10', 'Some Banknote with value and number of banknotes', required: true
        parameter '5', 'Some another Banknote with value and number of banknotes', required: false
      end

      let!(:atm) { create(:atm) }
      let!(:banknote_ten) { create(:banknote, value: 10) }
      let!(:banknote_five) { create(:banknote, value: 5) }
      let(:id) { atm.id }
      let('10') { '20' }
      let('5') { '4' }

      example_request 'Deposit Banknotes to ATM' do
        expect(response_status).to eq(201)
      end
    end

    get '/api/v1/atms/:id/withdraw?amount=237', format: :json do
      let!(:atm) { create(:atm) }
      let!(:banknote_one) { create(:banknote, value: 1) }
      let!(:banknote_two) { create(:banknote, value: 2) }
      let!(:banknote_ten) { create(:banknote, value: 10) }
      let!(:banknote_five) { create(:banknote, value: 5) }
      let!(:banknote_tfive) { create(:banknote, value: 25) }
      let!(:banknote_fifty) { create(:banknote, value: 50) }
      let!(:deposit) { create(:atm_banknote, atm: atm, banknote: banknote_one, amount: 30, operation: 0) }
      let!(:deposit2) { create(:atm_banknote, atm: atm, banknote: banknote_two, amount: 2, operation: 0) }
      let!(:deposit3) { create(:atm_banknote, atm: atm, banknote: banknote_five, amount: 15, operation: 0) }
      let!(:deposit4) { create(:atm_banknote, atm: atm, banknote: banknote_ten, amount: 10, operation: 0) }
      let!(:deposit5) { create(:atm_banknote, atm: atm, banknote: banknote_tfive, amount: 3, operation: 0) }
      let!(:deposit6) { create(:atm_banknote, atm: atm, banknote: banknote_fifty, amount: 2, operation: 0) }
      let(:id) { atm.id }

      example_request 'Withdraw Banknotes from ATM' do
        expect(response_status).to eq(200)
      end
    end
  end
end