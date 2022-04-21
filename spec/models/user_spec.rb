require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    before(:example) do
      @user = User.new({
        name: "David",
        email: "David@email.com",
        password: "password",
        password_confirmation: "password"
      })
    end
    it 'creates a valid new user' do
      expect(@user).to be_valid
    end

    it 'user should have name' do
      @user.name = nil
      @user.save
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include "Name can't be blank"
    end

    it 'user should have email' do
      @user.email = nil
      @user.save
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end

    it 'user should have password' do
      @user.password = nil
      @user.save
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end

    it 'user should have password_confirmation' do
      @user.password_confirmation = nil
      @user.save
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include "Password confirmation can't be blank"
    end

    it 'user password should match password confirmation' do
      @user.password_confirmation = 'newpassword'
      @user.save
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end

    it 'user password should match password confirmation' do
      @user.password_confirmation = 'newpassword'
      @user.save
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end

    it 'email must be unique' do
      @user.save
      @userTwo = User.new({
        name: "David",
        email: "DAVID@email.com",
        password: "password",
        password_confirmation: "password"
      })
      @userTwo.save
      expect(@userTwo).to_not be_valid
      expect(@userTwo.errors.full_messages).to include "Email has already been taken"
    end
  end

  describe '.authenticate_with_credentials' do
    before do
      @user = User.new({
        name: "David",
        email: "David@email.com",
        password: "password",
        password_confirmation: "password"
      })
      @user.save
    end

      it "should not authenticate with improper credentials" do
        email = "wrong@email.com"
        password = "wrongpassword"
        @testuser = User.authenticate_with_credentials(email, password)
        expect(@testuser).to be_nil
      end

      it "should authenticate with proper credentials" do
        email = "David@email.com"
        password = "password"
        @rightuser = User.authenticate_with_credentials(email, password)
        expect(@rightuser).to_not be_nil
      end
  end
end
