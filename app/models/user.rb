class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]
         has_one :cnab

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data["email"]).first
    unless user
        user = User.create(name: data['name'],
           email: data['email'],
           avatar: data['image'],
           full_name: "#{data['first_name']} "+data['last_name'],
           password: Devise.friendly_token[0,20]
        )
    end
    user
  end
end
