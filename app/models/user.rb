# == Schema Information
#
# Table name: users
#
#  id                  :integer         not null, primary key
#  nickname            :string(255)
#  avatar              :string(255)
#  email               :string(255)     default(""), not null
#  encrypted_password  :string(128)     default(""), not null
#  remember_created_at :datetime
#  created_at          :datetime
#  updated_at          :datetime
#

class User < ActiveRecord::Base
  # Relations
  #
  has_many :items, dependent: :destroy

  devise :database_authenticatable, :omniauthable, :registerable

  attr_accessible :email, :password, :password_confirmation, :remember_me

  validates :email, presence: true, uniqueness: true

  # OMNIAUTH
  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token['extra']['user_hash']
    if user = User.find_by_email(data["email"])
      user
    else # Create a user with a stub password.
      User.create!(:email => data["email"], :password => Devise.friendly_token[0,20])
    end
  end
end
