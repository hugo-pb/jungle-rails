require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'It must be created with a password and password_confirmation fields' do
      @user = User.new(name: 'test', email: 'TEST@TEST.com', password: "1234", password_confirmation: "1234")
      @user.save!
      expect(@user).to be_present
    end
    it 'It must be created with a password ' do
      @user = User.new(name: 'test', email: 'TEST@TEST.com', password_confirmation: "1234")
      @user.save
      expect(@user.errors.full_messages).to be_present
    end
    it 'It must be created with a password_confirmation fields' do
      @user = User.new(name: 'test', email: 'TEST@TEST.com', password: "1234")
      @user.save
      expect(@user.errors.full_messages).to be_present
    end
  end
end
