require 'rails_helper'

RSpec.describe 'Cycles', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/cycles/index'
      expect(response).to have_http_status(:success)
    end
  end
end
