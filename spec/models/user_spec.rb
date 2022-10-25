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
    it 'both passwords should match' do
      @user = User.new(name: 'test', email: 'TEST@TEST.com', password: "1235", password_confirmation: "1234")
      @user.save
      expect(@user).to be_invalid
    end
    
    it 'should error if email exist' do
      @user1 = User.new(name: 'test', email: 'TEST@TEST.com', password: "1234", password_confirmation: "1234")
      @user1.save
      @user = User.new(name: 'test', email: 'TEsT@TEST.com', password: "1234", password_confirmation: "1234")
      @user.save 
      expect(@user).to be_invalid
    end
    it 'password needs to be longer than 3' do
      @user = User.new(name: 'test', email: 'TEST@TEST.com', password: "12", password_confirmation: "12")
      @user.save
      expect(@user).to be_invalid
    end 
    it 'validation without name' do
      @user = User.new(name: nil, email: 'TEST@TEST.com', password: "12", password_confirmation: "12")
      @user.save
      expect(@user).to be_invalid
    end    
  end
   describe '.authenticate_with_credentials' do
    before do
      @user = User.create(name: 'test', email: 'TEST@TEST.com', password: "1234", password_confirmation: "1234")
    end
   it 'It logins ' do
      
      user_testing = User.authenticate_with_credentials('TEST@TEST.com', '1234')
      expect(user_testing).to be_present

    end
    it "logs in even with extra '  '"   do
      user_testing = User.authenticate_with_credentials('  TEST@TEST.com  ', '1234')
      expect(user_testing).to be_present

    end
    it 'It  logs in even with case difference' do
      user_testing = User.authenticate_with_credentials('TEsT@TEST.com', '1234')
     
      expect(user_testing).to be_present

    end
  end
end
