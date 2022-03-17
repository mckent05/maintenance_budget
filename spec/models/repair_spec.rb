require 'rails_helper'

RSpec.describe Repair, type: :model do
  context 'test for the equipment model should pass' do
    new_user = User.new(name: 'Akinlade Temitope', email: 'topea@yahoo.com', password: '123456')
    Equipment.new(user: new_user, name: 'filter', icon: 'icon.png')
    subject do
      Repair.new
    end

    before { subject.save }

    it 'should be inavlid because text is nil' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should be inavlid because text is nil' do
      subject.user = new_user
      subject.name = 'Filter'
      subject.amount = 250
      expect(subject).to be_valid
    end

    it 'should be inavlid because text is nil' do
      subject.user = new_user
      subject.name = 'Filter'
      subject.amount = '-250'
      expect(subject).to_not be_valid
    end

    it 'should be inavlid because text is nil' do
      subject.user = new_user
      subject.name = 'Filter'
      subject.amount = -250
      expect(subject).to_not be_valid
    end
  end
end
