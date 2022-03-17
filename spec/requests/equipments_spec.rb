require 'rails_helper'

RSpec.describe 'Groups', type: :request do
  include Devise::Test::IntegrationHelpers

  let(:user) { User.create(name: 'Akinlade tmitope', email: 'example@mail.com', password: '123456') }
  let(:equipment) { user.equipments.create(name: 'Car', icon: 'https://i.imgur.com/Ar3Lf3Dt.png') }
  describe 'GET /index' do
    before do
      sign_in user
      get equipments_path
    end

    it 'should return response status correct (ok)' do
      expect(response).to have_http_status(:ok)
    end

    it 'respons to html' do
      expect(response.content_type).to include 'text/html'
    end

    it 'should render the correspondig page' do
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /new' do
    before do
      sign_in user
      get new_equipment_path
    end
    it 'should return response status correct (ok)' do
      expect(response).to have_http_status(:ok)
    end
    it 'responds to html' do
      expect(response.content_type).to include 'text/html'
    end
    it 'should include correct placeholder' do
      expect(response.body).to include('Name')
    end
  end
end
