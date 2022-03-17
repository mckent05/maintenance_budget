require 'rails_helper'

RSpec.describe User, type: :model do
  context 'test for the equipment model should pass' do
    subject do
      User.new
    end

    before { subject.save }

    it 'should be inavlid because text is nil' do
      subject.name = nil
      subject.email = 'topea@yahoo.com'
      subject.password = '123456'
      expect(subject).to_not be_valid
    end

    it 'should be inavlid because icon is nil' do
      subject.name = 'Akinlade Temitope'
      subject.email = 'topea@yahoo.com'
      subject.password = '123456'
      expect(subject).to be_valid
    end
  end
end
