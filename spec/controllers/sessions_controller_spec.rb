require 'rails_helper'
require 'spec_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'GET #sign_in' do
    it 'renders the sign in page' do 
      get :'users/sign_in'
      expect(response.status).to eq(200)
    end
  end
end
