require 'rails_helper'

RSpec.describe PagesController do
  describe 'GET #search' do
    xit 'renders the search page' do
      get :search
      expect(response.status).to eq(200)
    end
  end
end


