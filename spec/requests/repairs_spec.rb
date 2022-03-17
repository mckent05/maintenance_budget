require 'rails_helper'

RSpec.describe 'GroupTrack', type: :request do
  include Devise::Test::IntegrationHelpers
  let(:user) { User.create(name: 'Akinlade tope', email: 'example@mail.com', password: '123456') }
  let(:equipment) { user.equipments.create(name: 'Car', icon: 'https://i.imgur.com/Ar3Lf3Dt.png') }
  let(:repair) { user.repairs.create(name: 'filter', amount: 200) }
  let(:equipmentrepairs) { Equipmentrepair.create(repair: repair.id, equipment: equipment.id) }

  describe 'GET /show' do
    before do
      sign_in user
      get equipment_path(equipment)
    end
    it 'should return response status correct (ok)' do
      expect(response).to have_http_status(:ok)
    end
    it 'respons to html' do
      expect(response.content_type).to include 'text/html'
    end

    it 'should render the correspondig page' do
      expect(response).to render_template(:show)
    end
  end
end
