require 'rails_helper'

RSpec.describe 'Equipment Show page', type: :feature do
  describe 'Equipment Show requirements' do
    before(:each) do
      User.create(
        name: 'akinlade temitope',
        id: 1,
        email: 'topea@yahoo.com',
        password: '123456',
        confirmed_at: Time.now
      )

      users = User.all
      Equipment.create(user: users[0], name: 'car', icon: 'car.jpg')
      Equipment.create(user: users[0], name: 'fridge', icon: 'fridge.jpg')
      Repair.create(user: users[0], name: 'fuel filter', amount: 300)
      Repair.create(user: users[0], name: 'engine', amount: 400)
      equipments = Equipment.all
      repairs = Repair.all
      Equipmentrepair.create(equipment: equipments[0], repair: repairs[0])
      Equipmentrepair.create(equipment: equipments[0], repair: repairs[1])
      visit new_user_session_path
      fill_in 'user_email', with: 'topea@yahoo.com'
      fill_in 'user_password', with: '123456'
      click_button 'Log in'
      visit root_path
      click_on equipments[0].name
      visit equipment_path(equipments[0].id)
    end

    it 'Expect show page to have repair name' do
      users = User.all
      equipments = users[0].equipments
      equipmentrepairs = equipments[0].equipmentrepairs
      equipmentrepairs.each do |eq|
        expect(page).to have_content(eq.repair.name)
      end
    end

    it 'Expect show page to have repair amount' do
      users = User.all
      equipments = users[0].equipments
      equipmentrepairs = equipments[0].equipmentrepairs
      equipmentrepairs.each do |eq|
        expect(page).to have_content(eq.repair.amount)
      end
    end
  end
end
