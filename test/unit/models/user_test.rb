require 'test_helper'

describe User do
  before do
    @user = User.make
  end

  describe 'relations' do
    it 'has_many items' do
      @user.must_respond_to :items
    end
  end

  describe 'validations' do
    it 'is not valid withoud an email' do
      @user.email = nil
      @user.valid?.must_equal false
    end
    it 'is not valid if email already exists' do
      @user.save!
      @repeated_user = User.make(email: @user.email)
      @repeated_user.valid?.must_equal false
    end
  end
end
