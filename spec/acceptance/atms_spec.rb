require 'spec_helper'
require 'rails_helper'
require 'acceptance_helper'

RSpec.resource Atm, type: %i[request api acceptance] do
  resource 'ATMs' do
    get '/api/v1/atms', format: :json do
      with_options scope: :business_entity do

      end
      example_request 'Created ATM' do
        expect(response_status).to eq(200)
        expect(json.count).to(satisfy { |v| v > 0 })
      end
    end
  end
end