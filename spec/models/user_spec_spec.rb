require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should validate the presence of password' do
      user = User.new(password: nil, password_confirmation: nil)
      expect(user).not_to be_valid
      expect(user.errors.full_messages).to include("Password can't be blank")
    end

    it 'should validate the presence of password_confirmation' do
      user = User.new(password: "password", password_confirmation: nil)
      expect(user).not_to be_valid
      expect(user.errors.full_messages).to include("Password confirmation can't be blank")
    end

    it 'should validate that password and password_confirmation match' do
      user = User.new(password: "password", password_confirmation: "different_password")
      expect(user).not_to be_valid
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    
    it 'should validate the presence of email' do
      user = User.new(email: nil)
      expect(user).not_to be_valid
      expect(user.errors.full_messages).to include("Email can't be blank")
    end

    it 'should validate the presence of first_name' do
      user = User.new(first_name: nil)
      expect(user).not_to be_valid
      expect(user.errors.full_messages).to include("First name can't be blank")
    end

    it 'should validate the presence of last_name' do
      user = User.new(last_name: nil)
      expect(user).not_to be_valid
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'should ensure email uniqueness' do
      user1 = User.create(email: "email@email.com", password: "password", password_confirmation: "password", first_name: "First", last_name: "Last")
      user2 = User.new(email: "EMAIL@EMAIL.COM", password: "password", password_confirmation: "password", first_name: "First", last_name: "Last")
      expect(user2).not_to be_valid
      expect(user2.errors.full_messages).to include("Email has already been taken")
    end

    it 'should validate that the password has a minimum length' do
      user = User.new(password: "short", password_confirmation: "short")
      expect(user).not_to be_valid
      expect(user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
  end

  describe '.authenticate_with_credentials' do
    before do
      @user = User.create(email: "user@example.com", password: "password", password_confirmation: "password", first_name: "Test", last_name: "User")
    end
  
    it 'should return the user if authentication is successful' do
      authenticated_user = User.authenticate_with_credentials("user@example.com", "password")
      expect(authenticated_user).to eq(@user)
    end
  
    it 'should return nil if authentication is unsuccessful' do
      authenticated_user = User.authenticate_with_credentials("user@example.com", "wrongpassword")
      expect(authenticated_user).to be_nil
    end

    it 'should authenticate even if there are spaces around email' do
      authenticated_user = User.authenticate_with_credentials("  user@example.com  ", "password")
      expect(authenticated_user).to eq(@user)
    end
    
    it 'should authenticate even if email has different cases' do
      authenticated_user = User.authenticate_with_credentials("USER@EXAMPLE.COM", "password")
      expect(authenticated_user).to eq(@user)
    end
  end

end