require 'rails_helper'

RSpec.describe 'Equipment Index page', type: :feature do
  describe 'Equipment Index requirements' do
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
    end

    it 'Log In, expect page to have username' do
      user = User.all
      expect(page).to have_content(user[0].name)
    end

    it 'Log In, expect to see equipment name' do
      user = User.all
      equipments = user[0].equipments
      equipments.each do |equipment|
        expect(page).to have_content(equipment.name)
      end
    end

    it 'Log In to the root page and see repair amount for each equipment' do
      users = User.all
      first_user = users[0]
      equipments = first_user.equipments
      equipments.each do |equipment|
        total = 0
        equipment.equipmentrepairs.each do |eq|
          total += eq.repair.amount
        end
        expect(page).to have_content(total)
      end
    end

    it 'Log In, expect to click on name of first equipment' do
      users = User.all
      first_user = users[0]
      equipments = first_user.equipments
      equipment_name = equipments[0].name
      click_link equipment_name
      expect(page).to have_current_path equipment_path(equipments[0].id)
    end
  end
end
